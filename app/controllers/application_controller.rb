class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def ensure_admin
    redirect_to "/" unless current_user.admin
  end

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find(session[:user_id])
    end
  end
end
