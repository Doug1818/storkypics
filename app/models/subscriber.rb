class Subscriber < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  #validates :first_name, presence: true, length: { maximum: 50 }
  #validates :last_name, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, 
  #					format: { with: VALID_EMAIL_REGEX },
  #					uniqueness: { case_sensitive: false }
end
