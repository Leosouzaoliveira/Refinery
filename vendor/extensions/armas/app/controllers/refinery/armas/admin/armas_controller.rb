module Refinery
  module Armas
    module Admin
      class ArmasController < ::Refinery::AdminController

        crudify :'refinery/armas/arma',
                :title_attribute => 'nome', :xhr_paging => true

      end
    end
  end
end
