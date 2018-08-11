require 'rails_helper'    

describe "As an unauthorized visitor" do
  describe "when I click on Sign In To Contact Us" do
    it "redirects to login page" do
      org = create(:organization)

      visit organization_path(org)

      click_on "Sign In To Contact Us"

      expect(current_path).to eq login_path
    
    end
  end
end
