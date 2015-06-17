class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.integer :amount
      t.boolean :paid, default: false, null: false
      t.date :emission_date
      t.date :due_date

      t.timestamps null: false
    end
  end
end
