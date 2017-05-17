class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, allow_blank: true
  validates :password, length: { minimum: 4 }
  validates_confirmation_of :password
  validates :name, uniqueness: { case_sensitive: false }

end
