class Item < ApplicationRecord
  belongs_to :user
  has_many :deal_items
  has_many :deals, through: :deal_items

  CATEGORIES = ["Dress", "Shoes", "Shirts", "Bags", "Blouse", "Skirt", "Trousers", "Suits", "Shirts", "Tuxedo"]
  validates :size, :name, :color, :description, presence: :true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
end
