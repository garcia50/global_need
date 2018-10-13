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

    it "should have organization content" do
      org = create(:organization, name: 'Red Cross3')

      visit organizations_path
      first('.panel > a').click

      expect(page).to have_content('Red Cross3')
      expect(page).to have_content('Who We Are')
      expect(page).to have_content('people')
      expect(page).to have_button('Sign In To Contact Us')
    end
  end

  describe "After entering an organizations show page" do
    it "I can see email link for the organization" do
      user = create(:user)
      org = create(:organization)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit organization_path(org)

      expect(page).to have_link(href: 'mailto: Red11@Cross.com')
      expect(page).to have_content('Red11@Cross.com')
    end
  end
end
