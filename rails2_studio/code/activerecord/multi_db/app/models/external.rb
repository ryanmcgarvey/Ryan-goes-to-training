class External < ActiveRecord::Base 
  establish_connection :external_db
  self.abstract_class = true
end