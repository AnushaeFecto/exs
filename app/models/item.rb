class Item < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Dress", "Shoes", "Shirts", "Bags", "Blouse", "Skirt", "Trousers", "Suits", "Shirts", "Tuxedo"]
  validates :size, :color, :description, presence: :true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
end
