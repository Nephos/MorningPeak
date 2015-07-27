class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title,                  :limit => 50, :default => ""
      t.text :comment
      t.references :commentable,        :polymorphic => true, :index => true
      t.references :creator,            :polymorphic => true, :index => true
      t.string :role,                   :default => "comments", :index => true
      t.timestamps
    end

  end

  def self.down
    drop_table :comments
  end
end