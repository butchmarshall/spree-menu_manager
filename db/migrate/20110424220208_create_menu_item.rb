class CreateMenuItem < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :name

      t.string  :type

      t.integer :menu_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.string  :menuable_type
      t.integer :menuable_id
      t.string  :menuable_content

      t.integer :is_image
      t.integer :is_popup

      t.string  :on_mouse_over
      t.string  :on_mouse_out
      t.string  :on_mouse_click

      t.string  :mouse_out_file_name
      t.string  :mouse_out_content_type
      t.integer :mouse_out_file_size

      t.string  :mouse_over_file_name
      t.string  :mouse_over_content_type
      t.integer :mouse_over_file_size

      t.string  :mouse_down_file_name
      t.string  :mouse_down_content_type
      t.integer :mouse_down_file_size
    end
  end

  def self.down
  end
end
