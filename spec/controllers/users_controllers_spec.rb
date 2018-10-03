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
          org = create(:organization)
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
        expect(flash[:error]).to be_present
      end

      it "renders the new template" do
        post(:create, params: {user: params})
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
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

      let(:user) { User.create(params) }

      context "given a successful user modification" do
        before do
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        end

        it "renders a success message" do
          patch(:update, params: {id: user.id, user: params.merge(first_name: "dav")} )
          expect(flash[:notice]).to be_present
        end

        it "redirects to user path" do
          patch(:update, params: {id: user.id, user: params.merge(first_name: "dav")} )
          expect(response).to redirect_to user_path(user)
        end
      end

      context "given an unsuccessful user modification" do
        before do
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        end

        it "renders an error message" do
          patch(:update, params: {id: user.id, user: {first_name: nil}})
          expect(flash[:error]).to be_present
        end
      end

      context "given an unauthenticated user" do 
        it "redirects back to the home page" do
          patch(:update, params: {id: user.id, user: params.merge(first_name: "dav")} )
          expect(response).to redirect_to root_path
        end
      end
      
    end
  end

  describe "Post #create" do 
    context "given a successful user org account" do 
      let(:params) do
        {
          first_name: "lou", 
          last_name: "gar",
          email: "lou@gmail.com",
          password: "pass",
          password_confirmation: "pass",
          organization: {
            name: "Health First",
            email: "hf@health.org",
            address: "601 E Rollins St, Orlando, FL 32803",
          }
        }
      end

      it "redirects back to the edit_org path" do
        post(:create, params: {user: params})
        org = Organization.last.id
        expect(response).to redirect_to edit_organization_path(org)
      end

      it "creates a welcome messgae" do
        post(:create, params: {user: params})
        expect(flash[:notice]).to be_present
      end
    end

    context "given a unsuccessful user org creation" do
      #Creates user without an email
      let(:params) do
        {
          first_name: "lou", 
          last_name: "gar",
          password: "pass",
          password_confirmation: "pass",
          organization: {
            name: "Health First",
            email: "hf@health.org",
            address: "601 E Rollins St, Orlando, FL 32803",
          }
        }
      end

      it "creates an error message" do 
        post(:create, params: {user: params})
        expect(flash[:error]).to be_present
      end

      it "renders the new template" do
        post(:create, params: {user: params})
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    context "modifying given user org data" do
      let(:params) do
        {
          first_name: "lou", 
          last_name: "gar",
          password: "pass",
          password_confirmation: "pass",
          organization: {
            name: "Health First",
            email: "hf@health.org",
            address: "601 E Rollins St, Orlando, FL 32803",
          }
        }
      end

      context "given a successful user org modification" do
        before do
          @user = create(:user) 
          @org = create(:organization)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        end

        it "renders a success message" do
          patch(:update, params: {id: @user.id, user: params.merge(name: "Health Central ")})
          expect(flash[:notice]).to be_present
        end

        # it "renders a success message" do
        #   patch(:update, params: {id: @org.id, user: params.merge(first_name: "dav")} )
        #   expect(flash[:notice]).to be_present
        # end

      #   it "redirects to user path" do
      #     patch(:update, params: {id: @user.id, user: params.merge(first_name: "dav")} )
      #     expect(response).to redirect_to user_path(@user)
      #   end
      end

      # context "given an unsuccessful user modification" do
      #   before do
      #     @user = create(:user) 
      #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      #   end

      #   it "renders an error message" do
      #     patch(:update, params: {id: @user.id, user: {first_name: nil}})
      #     expect(flash[:error]).to be_present
      #   end
      # end

      context "given an unauthenticated user" do 
        it "redirects back to the home page" do
          user = create(:user)
          patch(:update, params: {id: user.id, user: params.merge(first_name: "dav")} )
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end












