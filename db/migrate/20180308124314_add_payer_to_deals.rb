class AddPayerToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :payer, :string
  end
end
