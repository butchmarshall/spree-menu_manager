class MenuManagerHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_tabs do 
   %(<%= tab(:menus) %>)
  end

  insert_after :inside_head do

    %(

      <%= stylesheet_tag( 'menu_manager/dropdown-flyout', {} ) %>
      <!--[if gt IE 6]> 
        <style type="text/css">
        .menu-manager-dropdown-flyout .button .dropdown li, .menu-manager-dropdown-flyout a {{zoom: 1;}
        </style>
      <![endif]-->

      <!--[if lte IE 6]>
        <style type="text/css">
	      body {behavior: url(/csshover.htc);}
        </style>

        <noscript>
	      <style type="text/css">
        .menu-manager-dropdown-flyout .dropdown, .menu-manager-dropdown-flyout .dropdown div {width: 189px;}
        .menu-manager-dropdown-flyout .button .dropdown ul {margin: 0px;}
        .menu-manager-dropdown-flyout .dropdown, .nav .dropdown div {position: static;}
        .menu-manager-dropdown-flyout .dropdown ul {border: 0;}
        .menu-manager-dropdown-flyout .mini-zone {display: none;}
	      </style>
        </noscript>
      <![endif]-->


    )

  end

end
