class StaticPagesController < ApplicationController
  def home
  	@subscriber = Subscriber.new
  end

  def how_it_works
  end

  def privacy_policy
  end

  def user_agreement
  end

  def contact
  end
end
