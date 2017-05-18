class Show < ApplicationRecord
  belongs_to :user
  has_many :characters

  validates :name, presence: true
  validates :user_id, presence: true
end
