module ResourceController
  
  def self.create_for(model)
    name = model.to_s.underscore
    
    iv_name = "@#{name}"
    iv_plural_name = "@#{name.to_s.pluralize}"

    Class.new(ApplicationController) do  
      define_method("model=") do |value|
        instance_variable_set(iv_name, value)
      end
      
      define_method("model_plural=") do |value|
        instance_variable_set(iv_plural_name, value)
      end

      define_method(:index) do
        self.model_plural = resources = model.all

        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml  => resources }
          format.json { render :json => resources }
        end
      end
      
      define_method(:show) do
        self.model = resource = model.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => resource }
        end
      end 

      define_method(:new) do
        self.model = resource = model.new

        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => resource }
        end
      end

      define_method(:edit) do
        self.model = model.find(params[:id])
      end

      define_method(:create) do
        self.model = resource = model.new(params[name])

        respond_to do |format|
          if resource.save
            format.html { redirect_to(resource, :notice => "#{model} was successfully created.") }
            format.xml  { render :xml => resource, :status => :created, :location => resource }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => resource.errors, :status => :unprocessable_entity }
          end
        end
      end

      define_method(:update) do
        self.model = resource = model.find(params[:id])

        respond_to do |format|
          if resource.update_attributes(params[name])
            format.html { redirect_to(resource, :notice => "#{model} was successfully updated.") }
            format.xml  { head :ok }
          else 
            format.html { render :action => "edit" }
            format.xml  { render :xml => resource.errors, :status => :unprocessable_entity }
          end
        end
      end

      define_method(:destroy) do
        self.model = resource = model.find(params[:id])
        resource.destroy

        respond_to do |format|
          format.html { redirect_to({:action => "index"}, :notice => "#{model} was destroyed.") }
          format.xml  { head :ok }
        end
      end
      
    end
  end

end