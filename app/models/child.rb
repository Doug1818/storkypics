class Child < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :last_name
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
end
