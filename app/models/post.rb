class Post < ApplicationRecord
  belongs_to :region
  belongs_to :subregion
  belongs_to :neighborhood

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode

  validates :title, :body, presence: true
  belongs_to :category
  belongs_to :user

  default_scope { where(region_id: Region.find_by_shortname(@current_region))}




  def self.search(search)
    if search
        search = search.downcase
        where("lower(title) LIKE ?", "%#{search}%")
    else
      all
    end
  end

end
