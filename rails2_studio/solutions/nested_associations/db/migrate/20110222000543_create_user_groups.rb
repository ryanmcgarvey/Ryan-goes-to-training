class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :user_groups do |t|
      t.string :name
      t.string :location
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :user_groups
  end
end
