class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: session_params[:name])
    session[:user_id] = @user.id  if  @user && @user.authenticate(session_params[:password])
  end

  def destroy
    session.clear
  end

  private

  def session_params
    params.require(:session).permit(:password, :name)
  end

end
