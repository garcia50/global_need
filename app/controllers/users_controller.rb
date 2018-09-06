class UsersController < ApplicationController
  before_action :check_user, except: [:new, :create]
  before_action :authorize_user, only: [:update]

  # def index
  #   if current_user #&& current_user.admin?
  #     @users = User.all 
  #   else
  #     redirect_to root_path
  #   end
  # end

  def show;end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{current_user.first_name}"
      # path = params[:redirect_back] || user_path(@user)
      path = params[:redirect_back].present? ? params[:redirect_back] : user_path(@account)


      redirect_to path
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_account
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
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










