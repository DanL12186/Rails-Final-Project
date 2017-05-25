class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_user_characters, only: [:index, :favorite_characters]
  before_action :deny_unauthorized_access, only: [:new, :edit, :destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    @character.valid? ? (redirect_to user_show_characters_path) : (render :new)
  end

  def update
    @character.update(character_params)
    @character.valid? ? (redirect_to user_show_character_path(@character)) : (redirect_to edit_user_show_character_path)
  end

  def destroy
    @character.destroy
    redirect_to user_show_characters_path
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def set_user_characters
    @characters = current_user.characters
  end

  def character_params
    params.require(:character).permit(:name, :show_id, :deceased, :dislike, :note)
  end

end
