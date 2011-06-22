class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.with_options(:null => false) do |required|
        required.string :name
      end
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
