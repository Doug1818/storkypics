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
  end

  def update
  	@sendee = current_user.sendees.find(params[:id])
		if @sendee.update_attributes(params[:sendee])
			flash[:success] = "Update successful"
			redirect_to root_path
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