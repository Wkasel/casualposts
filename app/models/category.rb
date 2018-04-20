class Category < ApplicationRecord
  # validates :category, presence: true
  has_many :posts, dependent: :destroy
end
