#START:class_def
class EventsController < ApplicationController.for_resource(Event)
#END:class_def
  def search
    @term = params[:term]
    @events = Event.search(@term)

    respond_to do |format|
      format.html { render :action => :index}
      format.xml  { render :xml => @events }
    end
  end
#START:class_def
end
#END:class_def
