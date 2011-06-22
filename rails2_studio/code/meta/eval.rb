def create_greeting_method(method_name, greeting)
  code = %{
    def #{method_name}(person_name)
      puts "#{greeting.capitalize}, \#{person_name}!"
    end
  }
  eval code
end         
 
create_greeting_method("texan", "howdy")
create_greeting_method("hawaiian", "aloha")
 
texan("Dave")     # => "Howdy, Dave!"
hawaiian("Dave")  # => "Aloha, Dave!"
