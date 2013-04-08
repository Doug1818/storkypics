class AddFieldsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :order_id, :integer
    add_column :carts, :recipient_count, :integer
  end
end
