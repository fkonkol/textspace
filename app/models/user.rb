class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: -> email { email.strip.downcase }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
