class AddEventIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :event_id, :integer
  end

  def self.down
    remove_column :tweets, :event_id
  end
end
