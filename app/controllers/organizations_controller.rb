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
    @locations = @organization.locations
    @country = @locations.first.country
    @state = @locations.first.state
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.long
    end
  end
end



