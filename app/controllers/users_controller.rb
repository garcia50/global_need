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
    @user = User.find_by(slug: params[:slug])
    @organization = current_user.organization
  end

  def update
    @organization = current_user.organization
    if current_user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to user_path(current_user)
    else
      flash.now[:error] = current_user.errors.full_messages
      render :edit
    end
  end

  def org
    @user = User.new
    @organization = Organization.new
  end

  private 

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
      :password_confirmation,
      :slug
    )
  end

  def authorize_user
    unless current_user.id == params[:slug].to_i #In the future you can append additional statements here. ex: (current_user.id == params[user.id].to_i) && current_user.admin? 
      redirect_to root_path
      flash[:notice] = "Opps!! You do not have access to this page."
    end
  end
end
