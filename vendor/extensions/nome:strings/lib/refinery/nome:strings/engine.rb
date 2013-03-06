module Refinery
  module Nome:strings
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Nome:strings

      engine_name :refinery_nome:strings

      initializer "register refinerycms_nome:strings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "nome:strings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.nome:strings_admin_nome:strings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/nome:strings/nome:string',
            :title => 'modelo'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Nome:strings)
      end
    end
  end
end
