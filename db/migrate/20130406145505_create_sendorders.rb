class CreateSendorders < ActiveRecord::Migration
  def change
    create_table :sendorders do |t|
      t.integer :sendee_id
      t.integer :order_id

      t.timestamps
    end
  end
end
