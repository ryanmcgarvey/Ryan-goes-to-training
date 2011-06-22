module ApplicationHelper 
  def delete_child_option(form)
    unless form.object.new_record?
      form.check_box('_destroy') + form.label('_destroy', 'Delete')
    end
  end
end
