class ChildrenController < ApplicationController
before_filter :authenticate_user!, only: [:edit, :update]

  def edit
    @child = current_user.children.find(params[:id])
  end

  def update
  	@child = current_user.children.find(params[:id])
		params[:child][:birthday] = Date.strptime(params[:child][:birthday], "%m/%d/%Y").to_date
		if @child.update_attributes(params[:child])
			flash[:success] = "Update successful"
			redirect_to root_path
		else
			redirect_to 'edit'
		end
  end
end