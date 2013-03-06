module Refinery
  module Nome:strings
    class Nome:stringsController < ::ApplicationController

      before_filter :find_all_nome:strings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @nome:string in the line below:
        present(@page)
      end

      def show
        @nome:string = Nome:string.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @nome:string in the line below:
        present(@page)
      end

    protected

      def find_all_nome:strings
        @nome:strings = Nome:string.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/nome:strings").first
      end

    end
  end
end
