class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :characters, serializer: ShowCharacterSerializer
end
