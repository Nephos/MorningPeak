class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.references :creator, polymorphic: true, index: true
      t.belongs_to :ticket, index: true, foreign_key: true

      t.string :title
      t.text :description
      t.string :state, default: "open", null: false

      t.timestamps null: false
    end
  end
end
