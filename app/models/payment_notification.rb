class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :cart_id, :status, :transaction_id
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  def mark_cart_as_purchased
  	if status == "Completed"
  		cart.update_attributes(purchased_at: Time.now)
  		@order = Order.find(cart.order_id)
  		@user = User.find(@order.user_id)
  		@order.update_attributes(purchased_at: Time.now)
  		UserMailer.order_confirmation(@user, @order).deliver
	end
  end
end
