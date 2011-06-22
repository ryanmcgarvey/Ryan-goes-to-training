class AddUserToRegistration < ActiveRecord::Migration
  
  def self.up
    remove_column :registrations, :name
    remove_column :registrations, :email
    add_column    :registrations, :user_id, :integer
  end

  def self.down
    remove_column :registrations, :user_id    
    add_column    :registrations, :name, :string    
    add_column    :registrations, :email, :string
  end

end
