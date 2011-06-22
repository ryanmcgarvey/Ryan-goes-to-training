class AddEventIdToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :event_id, :integer
  end

  def self.down
    remove_column :reviews, :event_id
  end
end
