class LocationsController < ApplicationController
  def index
    @org = current_user.organization
    @locations = @org.locations
  end

  def new 
    @org = current_user.organization
    @location = @org.locations.new 
  end

  def create
    @org = current_user.organization
    @location = Location.new(location_params)

    if @location.save
      LocationsOrganization.create(
        organization_id: @org.id,
        location_id: @location.id
      )
      flash[:notice] = "You've successfully added a location to your organization."
      redirect_to organization_locations_path(@org)
    else
      flash.now[:error] =  @location.errors.full_messages
      render :new
    end
  end

  def edit
    @org = current_user.organization
    @loc = Location.find(params[:id])
  end

  def update
    @org = current_user.organization
    loc = Location.find(params[:id])
    if loc.update(location_params)
      flash[:notice] = "You've successfully updated locations for #{@org.name}"
      redirect_to  organization_locations_path(@org)
    else
      flash.now[:error] = current_user.errors.full_messages 
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:lat, 
                                     :long, 
                                     :country, 
                                     :state, 
                                     :city
                                    )
  end
end

