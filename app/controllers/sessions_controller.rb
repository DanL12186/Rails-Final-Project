class SessionsController < ApplicationController

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    session[:user_id] = @user.id  if  @user && @user.authenticate(session_params[:password])
    !!session[:user_id] ? (redirect_to user_path(@user)) : (redirect_to login_path)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def omnicreate
   user = User.find_or_create_by_omniauth(auth)
   session[:user_id] = user.id
   redirect_to root_path #required to get OmniAuth to work right
 end

 protected

 def auth
   request.env['omniauth.auth']
 end

  private

  def session_params
    params.require(:user).permit(:password, :name, :uid)
  end
end
