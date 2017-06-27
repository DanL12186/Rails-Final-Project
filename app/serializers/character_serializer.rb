class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :note, :quote, :name, :deceased, :dislike # do show
  #belongs_to :show
end
