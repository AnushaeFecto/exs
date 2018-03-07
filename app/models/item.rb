class Item < ApplicationRecord
  # include PgSearch

  # multisearchable against: [ :category, :description, :size, :color]
  include PgSearch
    pg_search_scope :search,
      against: [ :category, :description, :size, :color ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
        pg_search_scope :searchsize, against: [:size]
    pg_search_scope :searchcategory, against: [:category]
    pg_search_scope :searchcolor, against: [:color]
  belongs_to :user
  has_many :deal_items
  has_many :deals, through: :deal_items

  CATEGORIES = ["Dress", "Shoes", "Shirts", "Bags", "Blouse", "Skirt", "Trousers", "Suits", "Shirts", "Tuxedo"]
  validates :size, :color, :description, presence: :true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :photo, presence: true
 mount_uploader :photo, PhotoUploader
end

