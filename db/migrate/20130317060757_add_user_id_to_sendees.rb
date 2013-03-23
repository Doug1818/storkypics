class AddUserIdToSendees < ActiveRecord::Migration
  def change
    add_column :sendees, :user_id, :integer
  end
end
