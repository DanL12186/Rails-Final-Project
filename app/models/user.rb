class User < ApplicationRecord
  has_secure_password

  validates :name, uniqueness: true, presence: true #validates_presence_of
  validates :password_digest, presence: true, length: { minimum: 8 } #do I need presence if I have length?

end