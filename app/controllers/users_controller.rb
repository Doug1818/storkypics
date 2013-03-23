class UsersController < ApplicationController
before_filter :authenticate_user!, only: [:show, :update]

  def show
  	@user = User.find(params[:id])
  end

  def update
  	@user = current_user
  	@user.children.each_with_index do |child, idx|
      params[:user][:children_attributes].values[idx][:birthday] = 
      	Date.strptime(params[:user][:children_attributes].values[idx][:birthday], "%m/%d/%Y").to_date
    end if params[:user][:children_attributes]
		if @user.update_attributes(params[:user])
			flash[:success] = "Update successful"
			redirect_to root_path
		else
			flash[:success] = "Update unsuccessful. Please make sure all fields are filled out correctly."
			redirect_to root_path
		end
  end
end