class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.boolean :comments_enabled
      t.datetime :published_at
      t.integer :view_count

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
