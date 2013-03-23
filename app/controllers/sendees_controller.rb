class SendeesController < ApplicationController
before_filter :authenticate_user!, only: [:edit, :update]

  def edit
    @sendee = current_user.sendees.find(params[:id])
  end

  def update
  	@sendee = current_user.sendees.find(params[:id])
		if @sendee.update_attributes(params[:sendee])
			flash[:success] = "Update successful"
			redirect_to :back
		else
			flash[:success] = "Update unsuccessful. Please make sure all fields are filled out correctly."
			redirect_to 'edit'
		end
  end
end