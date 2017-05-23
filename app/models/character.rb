class Character < ApplicationRecord
  include CharactersHelper

  scope :like, -> { where(dislike: false) }
  scope :alive, -> { where(deceased: false) }

  belongs_to :show

  validates :name, presence: true

  validate :user_shows_have_unique_characters

  def user_shows_have_unique_characters
    binding.pry
    errors.add(:show, "Cannot have two characters with the same name in one show") if self.show.characters.any? {|char| char.name == self.name }
  end

end
