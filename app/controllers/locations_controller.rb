class LocationsController < ApplicationController
  def index
    @org = current_user.organization
    @locations = @org.locations
  end

end

