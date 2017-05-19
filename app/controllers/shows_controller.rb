class ShowsController < ApplicationController
  before_action :set_show, only: [:edit, :show, :update]

  def new
    @show = Show.new
  end

  def create
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
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:name, :user_id)
  end

end
