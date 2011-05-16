class CreateMenu < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.text :description
      t.string :placement
      t.integer :position
    end
  end

  def self.down
  end
end
