class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :characters, serializer: ShowCharacterSerializer #lets SCS set the attributes for show instead of serializing all the show's attributes
end
