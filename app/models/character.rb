class Character < ApplicationRecord
  include CharactersHelper

  scope :like, -> { where(dislike: false) }
  scope :alive, -> { where(deceased: false) }

  belongs_to :show

  validates :name, presence: true
  validates :name, uniqueness: { scope: :show }

  def show_attributes=(show)
    self.show = Show.find_or_create_by(name: show.name)
    self.show.update(show)
  end
end
