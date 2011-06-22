class EventsSweeper < ActionController::Caching::Sweeper
  observe Event
  
  def after_save(event)
    expire(event)
  end
  
  def after_destroy(event)
   expire(event) 
  end
  
private

  def expire(event)
    expire_page "/events/#{event.id}"
  end
end