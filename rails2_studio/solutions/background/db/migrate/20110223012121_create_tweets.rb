class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :place
      t.string :from_user_id_str
      t.string :profile_image_url
      t.string :from_user
      t.string :id_str
      t.string :metadata
      t.string :to_user_id
      t.text   :body
      t.string :tweet_id
      t.string :from_user_id
      t.string :to_user
      t.string :geo
      t.string :iso_language_code
      t.string :to_user_id_str
      t.string :source
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
