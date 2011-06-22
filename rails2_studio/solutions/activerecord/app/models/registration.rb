class Registration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  before_destroy :mark_deleted_at
  
  def confirm!
    convert_to ConfirmedRegistration, :confirmed_at
  end

protected
  
  def convert_to(new_class, attribute_to_touch)
    self.type = new_class.name
    self.update_attribute(attribute_to_touch, Time.now)
    self.save!
    new_class.find(id)
  end
  
  def mark_deleted_at
    update_attribute(:deleted_at, Time.now)
  end
end
