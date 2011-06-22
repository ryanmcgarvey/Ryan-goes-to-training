require "pdf_renderer"

#START:index
class EventsController < ApplicationController
   
  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "events", :template => "events/index.pdf.erb"
      end
    end
  end
#END:index
  
  def show
    @event = Event.find(params[:id])
  end

#START:index  
end
#END:index