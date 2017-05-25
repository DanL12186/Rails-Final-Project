class Show < ApplicationRecord

  belongs_to :user
  has_many :characters, dependent: :destroy

  validates :name, length: { minimum: 2 }
  validates :user_id, presence: true

  validate :users_have_unique_shows

  def users_have_unique_shows
    errors.add(:show, "already exists; a user can't have two shows with the same name.") if self.user.shows.any? { |show| show.name == self.name }
  end

  def characters_attributes=(characters_attributes)
    characters_attributes.each do |key, characters_attributes|
      self.characters.build(characters_attributes)
      self.characters.reject { |char| char.destroy if char.name.blank? }
    end
  end

end
