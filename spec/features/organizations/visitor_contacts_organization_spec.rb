require 'rails_helper'    

describe "As an unauthorized visitor" do
  describe "after selecting a organization" do 
    describe "when I click on Sign In To Contact Us" do
      it "redirects to login page" do
        org = create(:organization)

        visit organization_path(org)

        click_on "Sign In To Contact Us"

        expect(current_path).to eq login_path
      end

      it "I can log in using my credentials" do
        org = create(:organization)
        user = create(:user)

        visit organization_path(org)
        click_on "Sign In To Contact Us"
        expect(current_path).to eq login_path

        fill_in('Email', with: "keke1@aol.com")
        fill_in('Password', with: "pass")

        click_button "Login"
        expect(current_path).to eq organization_path(org)

      end
    end
  end

  describe "I can successfully signup and make new account" do
    it "redirects to create account page" do
      org = create(:organization)
      
      visit login_path

      click_on "SignUp"

      expect(current_path).to eq new_user_path
    end


      expect(current_path).to eq login_path
    
    end
  end
end
