require 'rails_helper'    

describe OrganizationsController do
  describe "POST #update" do
    context "given a successful org creation" do
      # let(:params) do
      #   {
      #     name: "lou", 
      #     description: "gar",
      #     bio: "Help build shelters throughout remote countries for desperate people.",
      #     email: "lou@gmail.com",
      #     phone: "800-1RESCUE",
      #     address: "1000 W. Colonial Dr, Orlando, Florida, United States",
      #     user_id: @user
      #   }
      # end    
      
      # let(:user) { User.create(params) }

      # it "redirects back to the user path" do
      #   post(:create, params: {user: params})
      #   expect(response).to redirect_to user_path(User.last.id)
      # end
      
      let(:user) { create(:user) }

      # user = create(:user)
      let(:params) do
        {
          name: "Health First",
          email: "hf@health.org",
          address: "601 E Rollins St, Orlando, FL 32803",
          user_id: user.id
        }
      end

      let(:org) { Organization.create(params) }

      it "renders a success message" do
require 'pry'; binding.pry
        patch(:update, params: {id: org.id, user: params.merge(name: "FHC")} )
        expect(flash[:notice]).to be_present
      end

    end
  end

end





























