class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :note, :quote, :name, :deceased, :dislike, :show
end
