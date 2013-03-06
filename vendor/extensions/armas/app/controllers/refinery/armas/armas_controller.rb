module Refinery
  module Armas
    class ArmasController < ::ApplicationController

      before_filter :find_all_armas
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @arma in the line below:
        present(@page)
      end

      def show
        @arma = Arma.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @arma in the line below:
        present(@page)
      end

    protected

      def find_all_armas
        @armas = Arma.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/armas").first
      end

    end
  end
end
