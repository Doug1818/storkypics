class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  def mark_cart_as_purchased
  	if status == "Completed"
  		cart.update_attributes(purchased_at: Time.now)
  		Order.find(cart.order_id).update_attributes(purchased_at: Time.now)
	end
  end
end
