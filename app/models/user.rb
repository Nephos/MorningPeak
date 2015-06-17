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

  after_create :create_client
  def create_client
    update(client: Client.create(name: email.gsub(/@.+/, '')))
  end

end
