class RegistrationsController < ApplicationController
  before_filter :authorize
  
  def create
    event = Event.find(params[:event_id])
    if event.register(current_user)
      @events = current_user.events
      flash[:notice] = 'Thanks for registering!'
    else
      flash[:error] = 'Registration failed!'
      redirect_to events_url
    end
  end
end
