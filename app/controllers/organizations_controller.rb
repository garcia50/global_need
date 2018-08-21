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
  end
end