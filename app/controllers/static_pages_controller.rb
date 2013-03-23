class StaticPagesController < ApplicationController
  def home
  	@subscriber = Subscriber.new
  end

  def products
  end
end
