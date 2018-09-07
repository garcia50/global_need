class SessionsController < ApplicationController
  before_action #:set_redirect_path, only: [:create]

  def new;end

  def create 
    @account = (User.find_by(email: params[:email]) || Organization.find_by(email: params[:email]))
    if @account && @account.authenticate(params[:password])
      session[:account_type] = @account.class.to_s
      session[:account_id] = @account.id
      flash.now[:notice] = "Logged in as #{@account.email}"
      
      path = params[:redirect_back].present? ? params[:redirect_back] : account_path(@account) #user_path(@account)
      
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

  private

  def account_path
    if @account.class == User
      user_path(@account)
    elsif @account.class == Organization
      organization_path(@account)
    end
  end

end