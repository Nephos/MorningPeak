class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :client

      t.string :name
      t.string :phone
      t.string :email

      t.date :last_contact

      t.text :notes

      t.string :region
      t.string :department
      t.string :postal_code
      t.text :adresse

      t.timestamps null: false
    end
  end
end
