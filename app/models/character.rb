class Character < ApplicationRecord
  include CharactersHelper

  belongs_to :show
end
