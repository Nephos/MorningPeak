class UpdateTickets < ActiveRecord::Migration
  def change

    rename_column :tickets, :head_creator_view_at, :creator_view_at
    remove_column :tickets, :ticket_id

  end
end
