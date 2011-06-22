module ApplicationHelper
  
  # This is one way you could implement an error messages helper.
  # This is here for reference.  
  def error_messages_for(object)
    if object && !object.errors.empty?
      messages = []
      for message in object.errors.full_messages
        messages << %(<li>#{message}</li>)
      end
      content_tag(:div, 
        content_tag(:h3, "Wh00ps! Please correct the following errors") +
        content_tag(:ul, raw(messages.join)),
        :id => 'errors')
    else
      ''
    end
  end
  
end
