class Category < ApplicationRecord
  # validates :category, presence: true
  has_many :posts, dependent: :destroy
  has_many :subcategories

  def titleize
    self.shortname.downcase.gsub(" ","-")
  end
end
