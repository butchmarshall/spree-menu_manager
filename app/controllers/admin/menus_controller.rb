class Admin::MenusController < Admin::BaseController
  resource_controller

  def new

    respond_to do |format|
      format.js { render :action => "new", :layout => false }
    end
  end
  
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to edit_admin_menu_path(@menu) }
      else
        format.html { redirect_to admin_menus_url }
      end
    end
  end

end
