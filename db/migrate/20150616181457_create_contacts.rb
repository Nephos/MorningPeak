class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email
      t.date :last_contact
      t.text :note
      t.string :region
      t.string :department
      t.string :postal_code
      t.text :address

      t.timestamps null: false
    end
  end
end
