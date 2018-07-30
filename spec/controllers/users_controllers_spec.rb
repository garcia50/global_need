require 'rails_helper'    

describe UsersController do
  describe "POST #create" do
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

      it "creates an error message" do 
        post(:create, params: {user: params})
        expect(flash[:notice]).to be_present
      end

      it "renders the new template" do
        post(:create, params: {user: params})
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    context "modifying given user data" do
      let(:params) do
        { 
          first_name: "lou", 
          last_name: "gar",
          email: "lou@gmail.com",
          password: "pass",
          password_confirmation: "pass"
        }
      end

      it "responds to GET" do
        post(:create, params: {user: params})
        get(:edit, params: {id: User.last.id})
        expect(response).to render_template(:edit)
      end

      it "responds to PATCH" do
        post(:create, params: {user: params})
        patch(:update, params: {id: 5, user: params})
        expect(response).to be_redirect
      end

    end
  end

end














