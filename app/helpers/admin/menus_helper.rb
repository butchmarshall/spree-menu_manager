module Admin::MenusHelper

  def menu_dropdown_flyout(obj, selected, depth = 0) 

    obj = obj.root_items if obj.class == Menu

    content_tag("ul", (depth == 0)? { :class => 'menu-manager-dropdown-flyout' } : {} ) do 
      obj.collect.with_index { |i,index|
        content_tag("li", (depth == 0)? { :class => "button" } : {} ) do

          if depth == 0

            content_tag("div", :class => "parent #{ (index==obj.length-1)? 'last-parent' : '' }" ) do
              link_to( i.name, i.linkable )+""+     
              if i.children.length > 0       
                content_tag("div", :class => "dropdown" ) do
                  menu_dropdown_flyout(i.children, selected, depth+1)
                end 
              else
                ""
              end
            end 

          else

            link_to( i.name, i.linkable )+
            content_tag("div", "", { :class => "mini-zone" })+
            if i.children.length > 0       
              content_tag("div") do
                  menu_dropdown_flyout(i.children, selected, depth+1)
              end
            else
              ""
            end

          end


        end+"".html_safe
      }.join("").html_safe
    end

  end


end
