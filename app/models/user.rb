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
  has_many :comments, as: :creator
  has_many :contacts, through: :client
  has_many :bills, through: :client

  after_create :create_client
  def create_client
    if self.client_id.nil?
      update_attributes(client: Client.create(name: email.tr('@.-_', ' ')))
    end
  end

  def tickets_unview
    tickets.where(creator_view_at: nil)
  end

end
