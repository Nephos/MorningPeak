class RenameLastContactToViewAtToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :view_at, :date
    remove_column :contacts, :last_contact, :date
  end
end
