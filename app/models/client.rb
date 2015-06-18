class Client < ActiveRecord::Base
  has_many :contacts
  has_many :bills
  has_many :tickets, through: :user
  belongs_to :contact
  belongs_to :user

  delegate :name, to: :contact, allow_nil: true, prefix: true

  def last_contact
    contacts.pluck('last_contact').max || "never"
  end

  def bills_retard
    bills.where("due_date <= '#{Date.today}'").where(paid: false)
  end

  def bills_advanced
    bills.where("due_date > '#{Date.today}'").where(paid: true)
  end

  def bills_next
    bills.where("due_date > '#{Date.today}'").where(paid: false)
  end

  def bills_old
    bills.where("due_date <= '#{Date.today}'").where(paid: true)
  end

  def financial_level
    weight = weight()
    retard = retard()
    th = weight.to_f / (weight + retard)
    th.nan? ? nil : (th * 100).round
  end

  def weight
    bills_old.pluck(:amount).sum
  end

  def retard
    bills_retard.pluck(:amount).sum
  end

  def next
    bills_next.pluck(:amount).sum
  end

end
