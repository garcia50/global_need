require 'rails_helper'    

describe UsersController do
  describe "POST create" do

    context "given a successful user creation" do
      let(:params) do
        {
          first_name: "lou", 
          last_name: "gar",
          email: "lou@gmail.com",
          password: "pass",
          password_confirmation: "pass"
        }
      end

      it "redirects back to the user path" do
        post(:create, params: {user: params})
        expect(response).to redirect_to user_path(User.last.id)
      end

      it "creates a welcome messgae" do
        post(:create, params: {user: params})
        expect(flash[:notice]).to be_present
      end

      context "given the redirect_back param is present" do
        it "redirects back to the given path" do
          org = Organization.create
          post(:create, params: {user: params, redirect_back: "/organizations/#{org.id}"})
          expect(response).to redirect_to organization_path(org)
        end
      end
    end

    context "given a unsuccessful user creation" do
      let(:params) do 
        {
          first_name: "lou",
          last_name: "gar",
          password: "pass",
          password_confirmation: "pass"
        }
      end

      it "" do 

      end

    end
  end
end
