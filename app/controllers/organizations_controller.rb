class OrganizationsController < ApplicationController
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
    @loca = @locations.first.country
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.long
    end
    # @hey = [{:lat=>36.7783, :lng=>-119.4179}]
  end
end