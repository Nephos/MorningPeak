class AddViewAtToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :view_at, :datetime
  end
end
