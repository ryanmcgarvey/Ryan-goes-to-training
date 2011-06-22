class RegistrationsController < ApplicationController
  
  before_filter :authorize
  
  def create
    event = Event.find(params[:event_id])
    @registration = Registration.new(:event_id => params[:event_id], :user_id => session[:user_id])
    if @registration.save
      @events = current_user.events
      flash[:notice] = 'Thanks for registering!'
    else
      flash[:error] = 'Registration failed!'
      redirect_to events_url
    end
  end
end
