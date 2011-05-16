class Menu < ActiveRecord::Base
	has_many :menu_items, :order => :position
	has_many :root_menu_items, :conditions => "`parent_id` IS NULL", :class_name => "MenuItem"

  def root_items
    if first = root_menu_items.first
      first.self_and_siblings
    else
      []
    end
  end

end
