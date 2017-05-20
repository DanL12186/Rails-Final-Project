class ShowsController < ApplicationController
  before_action :set_show, only: [:edit, :show, :update]
  # before_action :deny_unauthorized_access, only: [:new, :edit, :update, :destroy]

  def new
    @show = Show.new
    3.times { @show.characters.build }
  end

  def create
    @show = Show.new(show_params)
    @show.save ? (redirect_to user_shows_path(current_user)) : (redirect_to new_user_show_path)
  end

  def edit
  end

  def update
    @show.update(show_params)
    @show.valid? ? (redirect_to user_show_path(@show)) : (redirect_to edit_user_show_path(@show))
  end

  def destroy
  end

  def index
    @shows = current_user.shows
  end

  private

  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:name, :user_id, characters_attributes: [:id, :note, :show_id, :dislike, :deceased, :name])
  end

end
