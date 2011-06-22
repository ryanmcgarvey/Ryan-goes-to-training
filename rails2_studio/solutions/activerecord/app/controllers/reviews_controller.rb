class ReviewsController < ApplicationController
  
  before_filter :find_event
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params[:review].merge(:event_id => params[:event_id]))
    if @review.save
      redirect_to events_url, :notice => 'Thanks for your review!'
    else
      render :action => :new
    end
  end
  
private

  def find_event
    @event  = Event.find(params[:event_id])
  end 
end
