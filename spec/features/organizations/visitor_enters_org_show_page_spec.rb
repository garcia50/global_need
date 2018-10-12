require 'rails_helper'    

describe "As a visitor, when I visit the organization index page" do
  describe "I click on an organization" do
    it "takes me to that organizations show page" do
      org = create(:organization)

      visit root_path
      click_on "Global Need"
      expect(page).to have_current_path(organizations_path)
      
      visit organizations_path
      first('.panel > a').click
      expect(page).to have_current_path(organization_path(org))    
    end

end

