class Contact < ActiveRecord::Base
  belongs_to :client

  delegate :name, to: :client, prefix: true
end
