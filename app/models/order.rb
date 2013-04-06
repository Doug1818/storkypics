class Order < ActiveRecord::Base
  attr_accessible :recipient_count, :pictures_attributes

  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
