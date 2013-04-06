class AddSendToSelfToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :send_to_self, :boolean
  end
end
