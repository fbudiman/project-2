class ApplicationController < ActionController::Base
  helper_method :current_user

protected
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def authorize
    unless current_user
      flash[:error] = "You must sign in to access that page."
      redirect_to new_session_path
    end
  end

  # protect_from_forgery with: :exception
end
