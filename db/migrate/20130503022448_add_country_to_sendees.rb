class AddCountryToSendees < ActiveRecord::Migration
  def change
    add_column :sendees, :country, :string
  end
end
