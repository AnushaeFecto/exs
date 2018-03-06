class AddPaymentToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :payment, :jsonb
  end
end
