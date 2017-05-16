class User < ApplicationRecord
  has_secure_password

  validates :name, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true, allow_blank: true
  validates :password, length: { minimum: 4 }
  validates :password_digest, presence: true
  validates_confirmation_of :password

end
