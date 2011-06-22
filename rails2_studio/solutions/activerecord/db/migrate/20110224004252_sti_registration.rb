class StiRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :type, :string
    add_column :registrations, :confirmed_at, :datetime
    add_column :registrations, :paid_at, :datetime    
  end

  def self.down
    remove_column :registrations, :paid_at
    remove_column :registrations, :confirmed_at
    remove_column :registrations, :type
  end
end
