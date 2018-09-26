require 'rails_helper'    

describe OrganizationsController do
  describe "POST #create" do
    context "given a successful org creation" do
      let(:params) do
        {
          name: "lou", 
          description: "gar",
          bio: "Help build shelters throughout remote countries for desperate people.",
          email: "lou@gmail.com",
          phone: "800-1RESCUE"
          address: "1000 W. Colonial Dr, Orlando, Florida, United States"
          user_id: @user
        }
      
      let(:user) { User.create(params) }

      end    

    end
  end

end