class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :note, :quote, :name#, :deceased, :dislike # do show 
end
