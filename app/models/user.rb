class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         :recoverable,
         :rememberable,
         :trackable#,
         #:validatable
  has_one :client
  delegate :name, to: :client
  has_many :tickets, as: :creator
  has_many :contacts, through: :client
  has_many :bills, through: :client

  after_create :create_client
  def create_client
    update(client: Client.create(name: email.gsub(/@.+/, '')))
  end

end
