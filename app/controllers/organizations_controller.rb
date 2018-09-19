class OrganizationsController < ApplicationController
  #before action 1. Is the current_user an org.admin? AND is the org of that user the same as the org that their trying to go to in the edit
  before_action :check_user, except: [:new, :create, :org]
  before_action :authorize_org_user, only: [:edit, :update]

  def index
    if params[:search]
      @organizations = Organization.search(params[:search]).paginate(page: params[:page])
    else
      @organizations = Organization.paginate(page: params[:page])
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @org_hq = @organization.address

    if @organization.locations.present?
      @locations = @organization.locations.to_json
    end
require 'pry'; binding.pry
  end

  def edit
    @org = Organization.find(params[:id])
    @user = User.find(@org.user_id)
  end

  def update
    @org = Organization.find(params[:id])
    if @org.update(org_params)
      flash[:notice] = "Your Organizationhas been updated."
      redirect_to organization_path(@org)
    else
      flash.now[:error] = @org.errors.full_messages
      render :edit
    end
  end

  private

  def org_params
    params.require(:organization).permit(
      :name,
      :email,
      :phone,
      :description,
      :bio,
      :address
    )
  end
end




  def authorize_org_user
    unless current_user.organization.try(:id) == params[:id].to_i
      redirect_to root_path
      flash[:notice] = "Opps!! You do not have access to this page."
    end
  end
end
