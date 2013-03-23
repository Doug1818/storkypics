class Sendee < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :last_name, :state, :zip_code
  belongs_to :user
end
