class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail from:"Storkypics <contact@storkypics.com>", to: contact@storkypics.com, subject: "New order from #{@user.first_name} #{@user.last_name}"
  end
end
