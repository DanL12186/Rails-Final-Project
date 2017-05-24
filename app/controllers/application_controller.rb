class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to login_path unless logged_in?
  end

  def deny_unauthorized_access
    redirect_to root_path unless current_user.id == params[:id].to_i
  end


end
