class Sendee < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :last_name, :state, :zip_code, :relationship
  belongs_to :user
  has_many :sendorders, dependent: :destroy
  has_many :orders, through: :sendorders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :relationship, presence: true
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

  RELATIONSHIPS = ['Grandparent', 'Aunt/Uncle', 'Cousin', 'Parent', 'Friend', 'Other']
end
