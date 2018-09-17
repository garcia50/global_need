class OrganizationsController < ApplicationController
  #before action 1. Is the current_user an org.admin? AND is the org of that user the same as the org that their trying to go to in the edit

  def index
    if params[:search]
      @organizations = Organization.search(params[:search]).paginate(page: params[:page])
    else
      @organizations = Organization.paginate(page: params[:page])
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @address = @organization.address

    if @organization.locations.present?
      @locations = @organization.locations
      @country = @locations.first.country
      @state = @locations.first.state
      @city = @locations.first.city
      # @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      #   marker.lat location.lat
      #   marker.lng location.long
      # end
    end

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




