class Sendee < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :last_name, :state, :zip_code
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validate  :zip_code_length

  def zip_code_length
    if !self.zip_code.blank? && self.zip_code.length != 5
      self.errors[:zip_code] = "must be 5 digits"
    end
  end
end
