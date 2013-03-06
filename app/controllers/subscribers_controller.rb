class SubscribersController < ApplicationController
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    begin
      gb = Gibbon.new(ENV['MC_API_KEY'])
      list_id = gb.lists({:list_name => "Launch List"})["data"].first["id"]
      gb.list_subscribe(:id => list_id, :email_address => @subscriber.email, :merge_vars => {'fname' => @subscriber.first_name, 'lname' => @subscriber.last_name }, :double_optin => false)
    rescue Gibbon::MailChimpError => e
      logger.error "Mailchimp error while retrieving lists: #{e.message}"
      flash[:error] = "We're sorry, an error occurred. Either your information is incorrect or you have already signed up."
      redirect_to root_path
      return
    end
    @subscriber.save
    flash[:success] = "Thank you for your interest in Storkypics! We will be in touch soon!"
    redirect_to root_path
  end
end
