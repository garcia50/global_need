require 'rails_helper'    

describe "As a visitor, when I visit the organization index page" do
  describe "I click on an organization" do
    it "takes me to that organizations show page" do
      org = create(:organization)
      visit organizations_path
      first('.panel > a').click
      expect(current_path).to eq organization_path(org)    
    end
  end
end

