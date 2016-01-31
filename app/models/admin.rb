class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         #:recoverable,
         :rememberable#,
         #:trackable,
         #:validatable

  has_many :tickets, as: :creator
  has_many :comments, as: :creator

  def tickets_unview
    Ticket.all.where(admin_view_at: nil)
  end

end
