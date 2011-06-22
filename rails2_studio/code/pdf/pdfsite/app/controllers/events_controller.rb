#START:index
class EventsController < ApplicationController
  
 prawnto :prawn => { :page_size => [600, 300] },
         :filename => "events.pdf", :inline => nil
   
  def index
    @events = Event.all
    respond_to do |wants|
      wants.html # ...
      wants.pdf  { render :action => 'index_2' }
    end
  end  
  
#END:index
  
  def show
    @event = Event.find(params[:id])
  end

#START:index  
end
#END:index