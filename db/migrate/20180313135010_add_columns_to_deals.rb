class AddColumnsToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :requester_address, :string
    add_column :deals, :answerer_address, :string
  end
end
