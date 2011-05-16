Rails.application.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :menus do
      resources :menu_items
      resources :menu_item_eval_strings, :controller => "menu_items"
      resources :menu_item_links, :controller => "menu_items"
      resources :menu_item_pages, :controller => "menu_items"
      resources :menu_item_products, :controller => "menu_items"
    end
    resources :menu_items
  end
  match 'admin/menus/:menu_id/menu_items/:id/move_up' => "admin/menu_items#move_up", :via => :get, :as => :move_up_admin_menu_menu_items
  match 'admin/menus/:menu_id/menu_items/:id/move_down' => "admin/menu_items#move_down", :via => :get, :as => :move_down_admin_menu_menu_items
end
