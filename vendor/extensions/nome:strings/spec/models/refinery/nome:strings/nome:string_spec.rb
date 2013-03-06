require 'spec_helper'

module Refinery
  module Nome:strings
    describe Nome:string do
      describe "validations" do
        subject do
          FactoryGirl.create(:nome:string,
          :modelo => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:modelo) { should == "Refinery CMS" }
      end
    end
  end
end
