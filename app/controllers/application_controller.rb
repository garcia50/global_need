class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_account

  def current_account
    @current_account ||= if session[:account_type] == "User"
      User.find(session[:account_id])
    elsif session[:account_type] == "Organization"
      Organization.find(session[:account_id])
    end
  end

  def check_user
    redirect_to root_path if !current_account
  end
end
