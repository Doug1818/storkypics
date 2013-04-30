class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def order_confirmation(user, order)
    @user = user
    @order = order
    @admins = ["Heidi Kim <hkim@mba2014.hbs.edu>", 
    		   "Ana Mendy <amendy@mba2014.hbs.edu>", 
    		   "Peter Brooks <pbrooks@mba2014.hbs.edu>",
    		   "Christopher Sumner <csumner@mba2014.hbs.edu>",
    		   "Andrei Brasoveanu <abrasoveanu@mba2014.hbs.edu>",
    		   "Philippe Cahuzac <pcahuzac@mba2014.hbs.edu>",
    		   "Douglas Raicek <draicek@mba2014.hbs.edu>" ]
    
    mail from:"Storkypics <contact@storkypics.com>",
    to: "Storkypics <contact@storkypics.com>",
    cc: @admins,
    subject: "[Storkypics] New order from #{@user.first_name} #{@user.last_name}"
  end

  def new_user_alert(user)
    @user = user
    @admins = ["Heidi Kim <hkim@mba2014.hbs.edu>", 
    		   "Ana Mendy <amendy@mba2014.hbs.edu>", 
    		   "Peter Brooks <pbrooks@mba2014.hbs.edu>",
    		   "Christopher Sumner <csumner@mba2014.hbs.edu>",
    		   "Andrei Brasoveanu <abrasoveanu@mba2014.hbs.edu>",
    		   "Philippe Cahuzac <pcahuzac@mba2014.hbs.edu>",
    		   "Douglas Raicek <draicek@mba2014.hbs.edu>" ]
    
    mail from:"Storkypics <contact@storkypics.com>",
    to: "Storkypics <contact@storkypics.com>",
    cc: @admins,
    subject: "[Storkypics] New User: #{@user.first_name} #{@user.last_name}"
  end

  def new_user_welcome(user)
    @user = user
    
    mail from:"Storkypics <contact@storkypics.com>",
    to: @user.email,
    subject: "Welcome to Storkypics!"
  end
end
