class Admin::MenuItemsController < Admin::BaseController
  resource_controller
  
  before_filter :load_resources

  def move_down
    @menu_item = MenuItem.find(params[:id])

	  respond_to do |format|
      if @menu_item.move_right
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      else
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      end
	  end  
  end

  def move_up
    @menu_item = MenuItem.find(params[:id])

	  respond_to do |format|
      if @menu_item.move_left
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      else
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      end
	  end  
  end

  def index   

	  respond_to do |format|
		  format.html { render :action => :index }
	  end  
  end
  
  def new
    @menu = Menu.find(params[:menu_id])
	  @menu_item = MenuItem.new(:menu => @menu)
    
	  respond_to do |format|
		  format.html { render :action => :new, :layout => false }
	  end  
  end
  
  def edit
	  @menu_item = MenuItem.find(params[:id])
	  @menu = @menu_item.menu
    
	  respond_to do |format|
		  format.html { render :action => :edit }
	  end    
  end

  def create
    klass = ( ((!params[:type].to_s.empty?)? params[:type] : nil) || "MenuItem").constantize

    @menu_item = klass.new(params[:menu_item])

	  respond_to do |format|
      if @menu_item.save
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      else
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      end
	  end  
  end

  def update
    key = ( params[:klass] || "MenuItem").classify.tableize.singularize.to_sym

    @menu_item = MenuItem.find(params[:id])
    @menu_item.type = params[:type]

	  respond_to do |format|
      if @menu_item.update_attributes( params[key] )
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      else
  		  format.html { redirect_to( admin_menu_menu_items_path(@menu) ) }
      end
	  end  
  end

  
  # override the destory method to set deleted_at value
  # instead of actually deleting the product.
  def destroy
    @menu_item = MenuItem.find_by_id(params[:id])

    if @menu_item.destroy
      flash[:notice] = I18n.t("notice_messages.menu_item_deleted")
    else
      flash[:notice] = I18n.t("notice_messages.menu_item_not_deleted")
    end

    respond_to do |format|
      format.html { redirect_to collection_url }
      format.js  { render_js_for_destroy }
    end
  end

  def load_resources
	  @menu = Menu.find(params[:menu_id])

    @pages = Page.find_by_sql("SELECT * FROM `pages` ORDER BY `title` ")
    @products = Product.find_by_sql("SELECT * FROM `products` WHERE `deleted_at` IS NULL ORDER BY `name` ")
    @menu_items = @menu.root_items
  end

end
