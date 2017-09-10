class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :note, :quote, :name, :species, :deceased, :dislike, :show
end
