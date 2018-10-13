require 'rails_helper'    

describe "As a visitor" do
  describe "I visit the welcome page " do
    it "I see title and mission statement" do
      visit root_path
      expect(page).to have_content('Global Need')
      expect(page).to have_content('Connect')
      expect(page).to have_content('Grow')
      expect(page).to_not have_content('Sleep')
      expect(page).to have_link('login')
      expect(page).to have_link('signup')
    end

    it "A visitor clicks on title link - enters Org. index" do 
      visit root_path
      click_on "Global Need"
      expect(current_path).to eq organizations_path
    end

    it "A visitor clicks on login link - enters login page" do 
      visit root_path
      click_on "login"
      expect(current_path).to eq login_path
    end

    it "A visitor clicks on signup link - enters signup page" do 
      visit root_path
      click_on "signup"
      expect(current_path).to eq new_user_path
    end
  end
end
