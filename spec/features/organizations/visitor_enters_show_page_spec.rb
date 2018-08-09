require 'rails_helper'    

describe "As a visitor, when I visit the organization index page" do
  describe "I click on an organization" do
    it "takes me to that organizations show page" do
      org = create(:organization)

      visit root_path
      click_on "Global Need"
      expect(current_path).to eq organizations_path
      
      visit organizations_path
      first('.panel > a').click
      expect(current_path).to eq organization_path(org)    
    end

    it "should have organization content" do
      org = create(:organization)

      visit organizations_path
      first('.panel > a').click

      expect(page).to have_content('Red Cross3')
      expect(page).to have_content('Who We Are')
      expect(page).to have_content('people')
      expect(page).to have_button('Sign In To Contact Us')
    end

    it ""

  end
end

