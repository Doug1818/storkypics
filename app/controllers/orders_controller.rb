class OrdersController < ApplicationController
before_filter :authenticate_user!, only: [:new, :create, :show]

  def new
    @order = Order.new
    @order.pictures.new
    @cart = Cart.new
  end

  def create
  	@order = current_user.orders.build(params[:order])
  		if @order.send_to_self == true
		  	@order.update_attributes(recipient_count: @order.sendees.size + 1)
			else
				@order.update_attributes(recipient_count: @order.sendees.size)
			end
  	if @order.save
  		@cart = @order.carts.create(recipient_count: @order.recipient_count)
      redirect_to @cart.paypal_url(root_url, payment_notifications_url)
    else
      render 'new'
    end
  end

  def show
  	@order = Order.find(params[:id])
	end
end