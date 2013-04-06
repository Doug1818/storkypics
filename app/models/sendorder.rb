class Sendorder < ActiveRecord::Base
  attr_accessible :order_id

  belongs_to :order
  belongs_to :sendee
end
