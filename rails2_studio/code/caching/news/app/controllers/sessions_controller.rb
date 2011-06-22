class SessionsController < ApplicationController

  def new
  end

  def create
    # Don't do this!
    session[:user_id] = params[:name]
    redirect_to articles_url, :notice => "Welcome back!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to events_url, :notice => "You've been logged out."
  end

end