class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  before_validation :generate_slug
  after_validation :geocode
  validates :slug, uniqueness: true, presence: true

  validates :title, :body, presence: true
  belongs_to :category
  belongs_to :user


  def to_param
    slug
  end

  def generate_slug
    self.slug ||= "#{title.parameterize}/#{id}.html"
  end


  def self.search(search)
    if search
        search = search.downcase
        where("lower(title) LIKE ?", "%#{search}%")
    else
      all
    end
  end

end
