class ShowsController < ApplicationController
  before_action :set_show, only: [:edit, :show, :update]
  # before_action :deny_unauthorized_access, only: [:new, :edit, :update, :destroy]

  def new
    @show = Show.new
    @show.characters.build() #x.times do
  end

  def create
    @show = Show.create(show_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @shows = current_user.shows
  end

  private

  def set_show
    @show = Show.find(show_params[:user_id])
  end

  def show_params
    params.require(:show).permit(:name, :user_id, characters_attributes: [:show_id, :dislike, :deceased, :name])
  end

end
