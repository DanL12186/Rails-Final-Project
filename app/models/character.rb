class Character < ApplicationRecord
  include CharactersHelper

  scope :like, -> { where(dislike: false) }
  scope :alive, -> { where(deceased: false) }

  belongs_to :show

  validates :name, presence: true
  # validates :name, uniqueness: { scope: :show }
  # validate :user_shows_have_unique_characters
  #
  # def user_shows_have_unique_characters
  #   errors.add(:show, "Cannot have two characters with the same name in one show") if self.show.characters.any? {|char| char.name == self.name }
  # end

  def show_attributes=(show)
    self.show = Show.find_or_create_by(name: show.name)
    self.show.update(show)
  end

end
