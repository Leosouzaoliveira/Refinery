# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Nome:strings" do
    describe "Admin" do
      describe "nome:strings" do
        login_refinery_user

        describe "nome:strings list" do
          before do
            FactoryGirl.create(:nome:string, :modelo => "UniqueTitleOne")
            FactoryGirl.create(:nome:string, :modelo => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.nome:strings_admin_nome:strings_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.nome:strings_admin_nome:strings_path

            click_link "Add New Nome:String"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Modelo", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Nome:strings::Nome:string.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Modelo can't be blank")
              Refinery::Nome:strings::Nome:string.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:nome:string, :modelo => "UniqueTitle") }

            it "should fail" do
              visit refinery.nome:strings_admin_nome:strings_path

              click_link "Add New Nome:String"

              fill_in "Modelo", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Nome:strings::Nome:string.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:nome:string, :modelo => "A modelo") }

          it "should succeed" do
            visit refinery.nome:strings_admin_nome:strings_path

            within ".actions" do
              click_link "Edit this nome:string"
            end

            fill_in "Modelo", :with => "A different modelo"
            click_button "Save"

            page.should have_content("'A different modelo' was successfully updated.")
            page.should have_no_content("A modelo")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:nome:string, :modelo => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.nome:strings_admin_nome:strings_path

            click_link "Remove this nome:string forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Nome:strings::Nome:string.count.should == 0
          end
        end

      end
    end
  end
end
