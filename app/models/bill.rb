class Bill < ActiveRecord::Base
  belongs_to :client

  validates :due_date, presence: true

  delegate :name, to: :client, prefix: true

  scope :retard, -> {where("due_date <= '#{Date.today}'").where(paid: false)}
  scope :advanced, -> {where("due_date > '#{Date.today}'").where(paid: true)}
  scope :next, -> {where("due_date > '#{Date.today}'").where(paid: false)}
  scope :old, -> {where("due_date <= '#{Date.today}'").where(paid: true)}

end
