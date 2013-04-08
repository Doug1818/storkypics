class Cart < ActiveRecord::Base
  attr_accessible :recipient_count
  belongs_to :order

  def paypal_url(return_url)

    values = {
      :business => 'contact@storkypics.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    # These values set up the details for the item on paypal.
    values.merge!({
	    "amount_1" => if self.recipient_count? then self.recipient_count*3 else 1 end,
	    "item_name_1" => if self.recipient_count? 
	    				 then "Storkypics to #{self.recipient_count} #{'recipient'.pluralize(self.recipient_count)}"
	    				 else "Storkypics" end,
	    "item_number_1" => 1,
	    "quantity_1" => 1
    })

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

  end
end
