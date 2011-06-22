class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image_location
      t.text :location
      t.integer :capacity
      t.decimal :price
      t.datetime :starts_at
      t.timestamps
    end
  end
end
