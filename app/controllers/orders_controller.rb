class OrdersController < ApplicationController
before_filter :authenticate_user!, only: [:new]

  def new
    @order = Order.new
    @order.pictures.new
  end

  def create
  	@order = current_user.orders.build(params[:order])
  		if @order.send_to_self == true
		  	@order.update_attributes(recipient_count: @order.sendees.size + 1)
			else
				@order.update_attributes(recipient_count: @order.sendees.size)
			end
  	if @order.save
      flash[:success] = "Order created"
      redirect_to root_path
    else
      render 'new'
    end
  end
end