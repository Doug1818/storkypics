class UsersController < ApplicationController
before_filter :authenticate_user!, only: [:show, :update]

  def show
  	@user = User.find(params[:id])
  end

  def update
  	@user = current_user
		if @user.update_attributes(params[:user])
			flash[:success] = "Update successful"
			redirect_to root_path
		else
			flash[:error] = "Update unsuccessful. Please make sure all fields are filled out correctly."
			redirect_to root_path
		end
  end
end