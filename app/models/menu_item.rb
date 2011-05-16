class MenuItem < ActiveRecord::Base
	belongs_to :menu
	belongs_to :menu_item
	
	belongs_to :menuable, :polymorphic => true

  has_attached_file :mouse_out, :styles => { :thumb=> "100x100#" }
  has_attached_file :mouse_over, :styles => { :thumb=> "100x100#" }
  has_attached_file :mouse_down, :styles => { :thumb=> "100x100#" }

  acts_as_nested_set(:scope => :menu)

  Types = {
    :MenuItemPage => "Page",
    :MenuItemProduct => "Product",
    :MenuItemLink => "Link",
    :MenuItemEvalString => "Evaluated Expression"
  }

  def content
    self.menuable_content
  end

  def content_type
    self.class.name.to_s.gsub("MenuItem","")
  end

  def linkable
    "#"
  end

  def onclick
    "return false;"
  end
end
