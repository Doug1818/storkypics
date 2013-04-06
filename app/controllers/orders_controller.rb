class OrdersController < ApplicationController
before_filter :authenticate_user!, only: [:new]

  def new
    @order = Order.new
    @order.pictures.new
  end

  def create
  	@order = current_user.orders.build(params[:order])
  	if @order.save
      flash[:success] = "Order created"
      redirect_to root_path
    else
      render 'new'
    end
  end
end