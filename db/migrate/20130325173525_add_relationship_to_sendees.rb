class AddRelationshipToSendees < ActiveRecord::Migration
  def change
    add_column :sendees, :relationship, :string
  end
end
