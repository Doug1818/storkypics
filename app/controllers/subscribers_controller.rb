class SubscribersController < ApplicationController
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
      flash[:success] = "Thanks for your interest in Storkypics!"
      redirect_to root_path
      gb = Gibbon.new(ENV['MC_API_KEY'])
      gb.throws_exceptions = false
      list_id = gb.lists({:list_name => "Launch List"})["data"].first["id"]
      gb.list_subscribe(:id => list_id, :email_address => @subscriber.email, :merge_vars => {'fname' => @subscriber.first_name, 'lname' => @subscriber.last_name }, :double_optin => false)
    else
      flash[:error] = "Please enter a valid name and email"
      redirect_to root_path
    end
  end
end
