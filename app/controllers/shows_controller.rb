class ShowsController < ApplicationController
  before_action :set_show, only: [:edit, :show, :update]
  # before_action :deny_unauthorized_access, only: [:new, :edit, :update, :destroy]

  def new
    @show = Show.new
    2.times { @show.characters.build }
  end

  def create
    binding.pry
    @show = Show.new(show_params)
    @show.save
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
    params.require(:show).permit(:name, :user_id, characters_attributes: [:note, :show_id, :dislike, :deceased, :name])
  end

end
