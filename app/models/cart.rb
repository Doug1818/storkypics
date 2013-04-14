class Cart < ActiveRecord::Base
  attr_accessible :recipient_count, :purchased_at
  belongs_to :order
  has_many :payment_notifications

  def paypal_url(return_url, notify_url)

    values = {
      :business => 'contact@storkypics.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    # These values set up the details for the item on paypal.
    values.merge!({
	    "amount_1" => 
	    	if self.recipient_count?
	    		if Rails.env.production?
	    			self.recipient_count*3
    			else
	    			0.01
    			end
	    	else
	    		0.01
	    	end,
	    "item_name_1" => if self.recipient_count? 
	    				 then "Storkypics to #{self.recipient_count} #{'recipient'.pluralize(self.recipient_count)}"
	    				 else "Storkypics" end,
	    "item_number_1" => 1,
	    "quantity_1" => 1
    })

  
	"https://www.paypal.com/cgi-bin/webscr?" + values.to_query

  end
end
