class Contact < ActiveRecord::Base
  acts_as_commentable
  belongs_to :client

  delegate :name, to: :client, prefix: true
end
