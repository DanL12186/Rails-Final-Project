class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit, :update, :destroy]
  before_action :deny_unauthorized_access, only: [:edit, :update, :destroy]

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? (session[:user_id] = @user.id; redirect_to user_path(@user)) : (render :new)
  end

  def edit
    redirect_to root_path unless @user.id == current_user.id
  end

  def update
    @user.update(user_params)
    @user.valid? ? (redirect_to root_path) : (redirect_to edit_user_path)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation, :uid)
  end
end
