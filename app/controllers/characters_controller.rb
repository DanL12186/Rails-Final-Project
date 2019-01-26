class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in
  before_action :deny_unauthorized_access, only: [:new, :edit, :destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    @character.valid? ? (render json: @character, status: 201) : (render :new)#(redirect_to user_show_characters_path) : (render :new)
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @character }
    end
  end

  def update
    @character.update(character_params) ? (redirect_to user_show_character_path(@character)) : (render :edit)
  end

  def destroy
    @character.destroy if @character.user == current_user
    redirect_to user_show_characters_path
  end

  def index
    @characters = current_user.characters.includes(:show)
  end

  def favorite_characters
    @characters = current_user.favorite_characters
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :show_id, :deceased, :dislike, :note, :quote, :species)
  end

end
