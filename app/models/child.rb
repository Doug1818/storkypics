class Child < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :last_name
  belongs_to :user
end
