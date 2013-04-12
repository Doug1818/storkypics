class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :status, :transaction_id
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  def mark_cart_as_purchased
  	if status == "Completed"
  		cart.update_attribute(:purchased_at, Time.now)
  		Order.find(cart.order_id).update_attribute(:purchased_at, Time.now)
	end
  end
end
