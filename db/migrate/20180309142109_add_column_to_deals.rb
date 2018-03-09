class AddColumnToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :last_changed_by, :integer
  end
end
