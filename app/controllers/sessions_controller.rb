class SessionsController < ApplicationController
  before_action #:set_redirect_path, only: [:create]

  def new
  end

  def create 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now[:notice] = "Logged in as #{current_user.email}"
    end

    if params[:redirect_back]
      redirect_to params[:redirect_back]
    else
      redirect_to user_path(user)
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end