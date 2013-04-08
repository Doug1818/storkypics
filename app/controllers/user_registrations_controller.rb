class UserRegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.children.new
    @user.sendees.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome! You have signed up successfully."
      redirect_to root_path
      begin
        gb = Gibbon.new(ENV['MC_API_KEY'])
        list_id = gb.lists({:list_name => "Users"})["data"].first["id"]
        gb.list_subscribe(:id => list_id, :email_address => @user.email, :merge_vars => {'fname' => @user.first_name, 'lname' => @user.last_name }, :double_optin => false)
      rescue Gibbon::MailChimpError => e
        redirect_to root_path
        return
      end
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    if request.referer.include?("orders/new")
      @new_order_path = true
    else
      @new_order_path = false
    end
  end

  def update
    @user = current_user
    if @user.update_with_password(params[:user])
      flash[:success] = "You updated your account successfully."
      if params[:user][:new_order_path] == "true"
        redirect_to new_order_path
      else
        redirect_to root_path
      end
    else
      render 'edit'
    end  
  end

  def destroy
    super
  end
end