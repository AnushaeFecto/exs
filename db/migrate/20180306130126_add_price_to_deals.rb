class AddPriceToDeals < ActiveRecord::Migration[5.1]
  def change
    add_monetize :deals, :price
  end
end
