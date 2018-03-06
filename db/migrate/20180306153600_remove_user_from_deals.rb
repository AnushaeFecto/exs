class RemoveUserFromDeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :user_id
    add_column :deals, :requester_id, :integer
    add_column :deals, :answerer_id, :integer
  end
end
