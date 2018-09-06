class OrganizationsController < ApplicationController
  before_action :check_user, except: [:new, :create]
  before_action :authorize_user, only: [:update]

  def index
    if params[:search]
      @organizations = Organization.search(params[:search]).paginate(page: params[:page])
    else
      @organizations = Organization.paginate(page: params[:page])
    end
  end

  def new
    @organization = Organization.new
  end

  def create 
    @organization = Organization.new(organization_params)
    if @organization.save
      session[:organization_id] = @organization.id
      flash[:notice] = "Welcome to Global Need #{@organization.name}"
      redirect_to edit_organization_path(@organization)
    else
      flash.now[:error] = @organization.errors.full_messages
      render :new
    end
  end 

  def show
    @organization = Organization.find(params[:id])
    @locations = @organization.locations
    @country = @locations.first.country if @locations.first 
    @state = @locations.first.state if @locations.first
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.long
    end
  end

  def edit
    @organization = current_account
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name,
      :email,
      :phone,
      :description,
      :bio,
      :address,
      :password, 
      :password_confirmation
    )    
  end

  def authorize_user
    unless current_account.id == params[:id].to_i #In the future you can append additional statements here. ex: (current_user.id == params[user.id].to_i) && current_user.admin? 
      redirect_to root_path
      flash[:notice] = "Opps!! You do not have access to this page."
    end
  end
end















