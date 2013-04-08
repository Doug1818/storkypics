class Order < ActiveRecord::Base
  attr_accessible :recipient_count, :send_to_self, :pictures_attributes, :sendee_ids

  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
  has_many :sendorders, dependent: :destroy
  has_many :sendees, through: :sendorders
  has_many :carts, dependent: :destroy

  validate :validate_pictures

  def validate_pictures
    errors.add(:no_more, "than 3 pictures can be sent in one order.") if pictures.size > 3
  end
end
