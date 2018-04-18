class User < ApplicationRecord
  include Gravtastic
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, length: {minimum: 6}

  has_many :posts
  has_gravatar

  has_secure_password
end
