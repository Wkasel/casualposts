class Region < ApplicationRecord
  has_many :subregions

  def nearby_regions
    Region.where(state: self.state).where.not(shortname:self.shortname)
  end
end
