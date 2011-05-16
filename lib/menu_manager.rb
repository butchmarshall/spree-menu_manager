require 'spree_core'
require 'menu_manager_hooks'

module MenuManager
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate

      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      Admin::NavigationHelper.module_eval do
        def link_to_edit(resource, options={})
          url = options.has_key?(:url)? options[:url] : edit_object_url(resource)

          link_to_with_icon('edit', t("edit"), url, options)
        end
      end

      # make your helper avaliable in all views
      Spree::BaseController.class_eval do
        helper MenusHelper
      end

    end

    config.to_prepare &method(:activate).to_proc

  end
end

