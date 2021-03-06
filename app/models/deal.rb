class Deal < ApplicationRecord
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  belongs_to :answerer, class_name: 'User', foreign_key: 'answerer_id'
  monetize :price_cents
  has_many :deal_items, dependent: :destroy
  has_many :items, through: :deal_items

  def items_from(user)
    self.items.where(user_id: user.id)
  end
end
