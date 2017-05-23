class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_user_characters, only: [:index, :favorite_characters]

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    @character ? (redirect_to user_show_characters_path) : (redirect_to new_user_show_character_path)
  end

  def edit
    redirect_to root_path unless current_user.id == @character.show.user_id
  end

  def update
    @character.update(character_params)
    @character.valid? ? (redirect_to user_show_character_path(@character)) : (redirect_to edit_user_show_character_path)
  end


  def destroy
    @character.destroy
    redirect_to user_show_characters_path
  end

  def favorite_characters
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
