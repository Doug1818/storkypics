class StaticPagesController < ApplicationController
  def home
  	@subscriber = Subscriber.new
  end

  def how_it_works
  end
end
