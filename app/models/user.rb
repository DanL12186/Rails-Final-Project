class User < ApplicationRecord
  has_secure_password

  validates :name, uniqueness: true, presence: true #validates_presence_of format instead?
  validates :email, uniqueness: true, if: 'email.present?'
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4 } #do I need presence if I have length?
  validates_confirmation_of :password

end
