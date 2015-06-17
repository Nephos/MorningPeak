class Client < ActiveRecord::Base
  has_many :contacts
  has_many :bills
  belongs_to :contact

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

end
