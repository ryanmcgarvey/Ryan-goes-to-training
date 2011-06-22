class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string  :name
      t.string  :status
      t.integer :manager_id
      t.integer :department
      t.string  :type
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
