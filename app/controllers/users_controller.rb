class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
  end

  def show
  end

  def edit #don't really need
  end

  def update
  end

  def index
    @users = User.all
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end


end
