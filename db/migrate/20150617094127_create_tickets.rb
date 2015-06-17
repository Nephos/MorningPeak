class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :bill, index: true, foreign_key: true
      t.belongs_to :ticket, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :state, default: "open", null: false

      t.timestamps null: false
    end
  end
end
