class CreateSendees < ActiveRecord::Migration
  def change
    create_table :sendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
