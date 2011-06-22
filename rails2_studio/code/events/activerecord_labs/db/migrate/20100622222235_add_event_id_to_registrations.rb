class AddEventIdToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :event_id, :integer
  end

  def self.down
    remove_column :registrations, :event_id
  end
end
