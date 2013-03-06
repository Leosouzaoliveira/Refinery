# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Armas" do
    describe "Admin" do
      describe "armas" do
        login_refinery_user

        describe "armas list" do
          before do
            FactoryGirl.create(:arma, :nome => "UniqueTitleOne")
            FactoryGirl.create(:arma, :nome => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.armas_admin_armas_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.armas_admin_armas_path

            click_link "Add New Arma"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Nome", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Armas::Arma.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Nome can't be blank")
              Refinery::Armas::Arma.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:arma, :nome => "UniqueTitle") }

            it "should fail" do
              visit refinery.armas_admin_armas_path

              click_link "Add New Arma"

              fill_in "Nome", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Armas::Arma.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:arma, :nome => "A nome") }

          it "should succeed" do
            visit refinery.armas_admin_armas_path

            within ".actions" do
              click_link "Edit this arma"
            end

            fill_in "Nome", :with => "A different nome"
            click_button "Save"

            page.should have_content("'A different nome' was successfully updated.")
            page.should have_no_content("A nome")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:arma, :nome => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.armas_admin_armas_path

            click_link "Remove this arma forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Armas::Arma.count.should == 0
          end
        end

      end
    end
  end
end
