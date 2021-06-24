class User < ApplicationRecord
  # call back function
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :microposts
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {maximum: 50}
  has_secure_password
end

