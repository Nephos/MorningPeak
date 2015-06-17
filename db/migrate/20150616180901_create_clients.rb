class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|

      t.belongs_to :user

      t.string :name
      t.string :url
      t.string :activity
      t.text :contact_reasons
      #main contact
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
