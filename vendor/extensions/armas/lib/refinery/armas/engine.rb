module Refinery
  module Armas
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Armas

      engine_name :refinery_armas

      initializer "register refinerycms_armas plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "armas"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.armas_admin_armas_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/armas/arma',
            :title => 'nome'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Armas)
      end
    end
  end
end
