require 'rails_helper'    

describe "As a user" do
  describe "when I enter the welcome" do
    it "I can login with my user credentials" do
      user = create(:user)
      visit '/'

      click_on "login"

      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)

      click_on "Login"

      expect(page).to have_content("Be the change you wish to see in the world!")
      expect(page).to have_content("It's better to be a small part of something, than to be a big part of nothing.")    
      expect(user).to eq User.last
    end

    it "I can signup as a new user" do 
      visit '/'

      click_on "signup"

      fill_in('user_first_name', with: "John")
      fill_in('user_last_name', with: "Doe")
      fill_in('user_email', with: "john@doe.com")
      fill_in('user_password', with: "pass")
      fill_in('user_password_confirmation', with: "pass")

      click_on "Submit"

      expect(page).to have_content("Be the change you wish to see in the world!")
      expect(page).to have_content("It's better to be a small part of something, than to be a big part of nothing.")    
      expect(User.last.email).to eq "john@doe.com"
    end
  end
end
