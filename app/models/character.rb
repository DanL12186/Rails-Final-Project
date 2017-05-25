class Character < ApplicationRecord
  include CharactersHelper

  scope :like, -> { where(dislike: false) }
  scope :alive, -> { where(deceased: false) }

  belongs_to :show

  validates :name, length: {minimum: 2}, uniqueness: { scope: :show }

end
