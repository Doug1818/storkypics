class UserRegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.children.new
    @user.sendees.new
  end

  def create
    @user = User.new(params[:user])
    @user.children.each_with_index do |child, idx|
      child.birthday = Date.strptime(params[:user][:children_attributes].values[idx][:birthday], "%m/%d/%Y").to_date
    end
    if @user.save
      sign_in @user
      flash[:success] = "Welcome! You have signed up successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    super
  end
end