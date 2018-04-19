class Subregion < ApplicationRecord
  has_many :neighborhoods
  belongs_to :region
end
