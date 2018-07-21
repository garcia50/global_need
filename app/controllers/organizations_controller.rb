class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.paginate(page: params[:page])
  end

end