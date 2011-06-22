# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110223012526) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_location"
    t.text     "location"
    t.integer  "capacity"
    t.decimal  "price"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.string   "hashtag"
  end

  create_table "registrations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "user_id"
  end

  create_table "reviews", :force => true do |t|
    t.string   "reviewer"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "tweets", :force => true do |t|
    t.string   "place"
    t.string   "from_user_id_str"
    t.string   "profile_image_url"
    t.string   "from_user"
    t.string   "id_str"
    t.string   "metadata"
    t.string   "to_user_id"
    t.text     "body"
    t.string   "tweet_id"
    t.string   "from_user_id"
    t.string   "to_user"
    t.string   "geo"
    t.string   "iso_language_code"
    t.string   "to_user_id_str"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
