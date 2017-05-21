class User < ApplicationRecord
  include ApplicationHelper
  has_secure_password

  has_many :shows
  has_many :characters, through: :shows

  validates :email, uniqueness: true, allow_blank: true
  validates :password, length: { minimum: 4 }
  validates_confirmation_of :password
  validates :name, uniqueness: { case_sensitive: false }

end
