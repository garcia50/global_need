class UsersController < ApplicationController
  before_action :check_user, except: [:new, :create, :org]
  before_action :authorize_user, only: [:update]

  def show;end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{current_user.first_name}"
      path = params[:redirect_back].present? ? params[:redirect_back] : user_path(@user)
      if params[:user][:organization].present?
        @org = Organization.create(name: params[:user][:organization][:name],
                                   email: params[:user][:organization][:email],
                                   address: params[:user][:organization][:address],
                                   user: @user
                                  )
        path = edit_organization_path(@org)
      end
      redirect_to path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @organization = current_user.organization
  end

  def update
    if params[:user].include?(:organization)
      updated_user_org
    else
      updated_user
    end
  end

  def org
    @user = User.new
    @organization = Organization.new
  end

  private 

  def authorize_user
    unless current_user.id == params[:id].to_i #In the future you can append additional statements here. ex: (current_user.id == params[user.id].to_i) && current_user.admin? 
      redirect_to root_path
      flash[:error] = "Opps!! You do not have access to this page."
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name,
      :email,
      :phone,
      :sex,
      :age,
      :skills,
      :password, 
      :password_confirmation
      # :slug
    )
  end

  def org_params
    params[:user].require(:organization).permit(
      :name, 
      :email,
      :phone,
      :description,
      :bio,
      :address
    )
  end

  def authorize_user
    unless current_user.id == params[:id].to_i #In the future you can append additional statements here. ex: (current_user.id == params[user.id].to_i) && current_user.admin? 
      redirect_to root_path
      flash[:error] = "Opps!! You do not have access to this page."
    end
  end
end
