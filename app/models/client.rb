class Client < ActiveRecord::Base
  has_many :contacts
  has_many :bills
end
