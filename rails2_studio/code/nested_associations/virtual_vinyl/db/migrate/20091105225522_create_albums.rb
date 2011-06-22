class CreateAlbums < ActiveRecord::Migration 
  
  def self.up
    create_table :albums do |t|
      t.with_options(:null => false) do |required|
        required.string :title
        required.integer :year
        required.string :condition
        required.integer :artist_id
      end
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
