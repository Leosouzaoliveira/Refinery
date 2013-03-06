require 'spec_helper'

module Refinery
  module Armas
    describe Arma do
      describe "validations" do
        subject do
          FactoryGirl.create(:arma,
          :nome => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:nome) { should == "Refinery CMS" }
      end
    end
  end
end
