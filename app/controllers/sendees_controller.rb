class SendeesController < ApplicationController
before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def new
    @sendee = Sendee.new
  end

  def create
    @sendee = current_user.sendees.build(params[:sendee])
    if @sendee.save
      flash[:success] = "Recipient added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @sendee = current_user.sendees.find(params[:id])
    if request.referer.include?("orders/new")
      @new_order_path = true
    else
      @new_order_path = false
    end
  end

  def update
  	@sendee = current_user.sendees.find(params[:id])
		if @sendee.update_attributes(params[:sendee])
			flash[:success] = "Update successful"
			if params[:sendee][:new_order_path] == "true"
        redirect_to new_order_path
      else
        redirect_to root_path
      end
		else
			render 'edit'
		end
  end

  def destroy
    @sendee = current_user.sendees.find(params[:id])
    @sendee.destroy
    flash[:notice] = "Recipient deleted"
    redirect_to root_path
  end
end