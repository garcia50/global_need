class SessionsController < ApplicationController
  before_action #:set_redirect_path, only: [:create]

  def new;end

  def create 
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.now[:notice] = "Logged in as #{current_user.email}"
      path = params[:redirect_back] || user_path(@user)
      redirect_to path
    else
      flash.now[:notice] = "Please enter your email and password."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end