class AddDeletedAtToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :deleted_at, :datetime    
  end

  def self.down
    remove_column :registrations, :deleted_at
  end
end
