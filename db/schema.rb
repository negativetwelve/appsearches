# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121211212811) do

  create_table "apps", :force => true do |t|
    t.string   "kind"
    t.text     "features"
    t.text     "supported_devices"
    t.boolean  "is_gamecenter_enabled"
    t.string   "artist_view_url"
    t.string   "artwork_url_60"
    t.text     "screenshot_urls"
    t.text     "ipad_screenshot_urls"
    t.string   "artwork_url_512"
    t.integer  "artist_id"
    t.string   "artist_name"
    t.decimal  "price",                                   :precision => 10, :scale => 2
    t.string   "version"
    t.text     "description"
    t.text     "genre_ids"
    t.datetime "release_date"
    t.string   "seller_name"
    t.string   "currency"
    t.text     "genres"
    t.string   "bundle_id"
    t.integer  "track_id"
    t.string   "track_name"
    t.string   "primary_genre_name"
    t.integer  "genre_id"
    t.text     "release_notes"
    t.string   "wrapper_type"
    t.string   "content_advisory_rating"
    t.string   "artwork_url_100"
    t.string   "track_censored_name"
    t.string   "track_view_url"
    t.text     "language_codes"
    t.string   "file_size_bytes"
    t.string   "formatted_price"
    t.decimal  "average_user_rating_for_current_version", :precision => 10, :scale => 2
    t.integer  "user_rating_count_for_current_version"
    t.string   "track_content_rating"
    t.decimal  "average_user_rating",                     :precision => 10, :scale => 2
    t.integer  "user_rating_count"
    t.integer  "rank"
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
  end

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
