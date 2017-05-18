class Character < ApplicationRecord
  include CharactersHelper

  belongs_to :show

  validates :name, presence: true
  
end
