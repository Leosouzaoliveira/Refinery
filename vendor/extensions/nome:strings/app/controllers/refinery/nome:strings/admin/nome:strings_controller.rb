module Refinery
  module Nome:strings
    module Admin
      class Nome:stringsController < ::Refinery::AdminController

        crudify :'refinery/nome:strings/nome:string',
                :title_attribute => 'modelo', :xhr_paging => true

      end
    end
  end
end
