class ApplicationController < ActionController::Base
  protect_from_forgery

  # Make the authentication-related methods accessible 
  # as view helpers.
  helper_method :logged_in?, :current_user
  
  before_filter :find_user_events

  def self.for_resource(name)
    ResourceController.create_for(name)
  end
  
protected 

  def find_user_events
    @user_events = current_user ? current_user.events : []
  end

  # If the user isn't logged in, redirects 
  # them to the login form.
  def authorize 
    unless logged_in? && current_user
      flash[:notice] = "Please log in" 
      redirect_to new_session_url
    end 
  end

  # Returns true if the user is logged in,
  # false otherwise.
  def logged_in?
    session[:user_id]
  end

  # Accesses the current user from the session,
  # assigning the current user if necessary.
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

end
