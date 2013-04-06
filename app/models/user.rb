class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :address,
  	:city, :state, :zip_code, :children_attributes, :sendees_attributes, :new_order_path
  # attr_accessible :title, :body
  attr_accessor :new_order_path

  has_many :children, dependent: :destroy
  has_many :sendees, dependent: :destroy
  has_many :orders, dependent: :destroy
  accepts_nested_attributes_for :children, :sendees, allow_destroy: true

  scope :pictures, lambda { |user| joins(:order).joins(:order => :pictures).where("pictures.user_id = ?", user.id) }

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

  STATES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 
  	'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 
  	'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 
  	'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 
  	'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 
  	'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
end
