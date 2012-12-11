class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :kind
      t.text :features
      t.text :supported_devices
      t.boolean :is_gamecenter_enabled
      t.string :artist_view_url
      t.string :artwork_url_60
      t.text :screenshot_urls
      t.text :ipad_screenshot_urls
      t.string :artwork_url_512
      t.integer :artist_id
      t.string :artist_name
      t.decimal :price, :precision => 10, :scale => 2
      t.string :version
      t.text :description
      t.text :genre_ids
      t.datetime :release_date
      t.string :seller_name
      t.string :currency
      t.text :genres
      t.string :bundle_id
      t.integer :track_id
      t.string :track_name
      t.string :primary_genre_name
      t.integer :genre_id
      t.text :release_notes
      t.string :wrapper_type
      t.string :content_advisory_rating
      t.string :artwork_url_100
      t.string :track_censored_name
      t.string :track_view_url
      t.text :language_codes
      t.string :file_size_bytes
      t.string :formatted_price
      t.decimal :average_user_rating_for_current_version, :precision => 10, :scale => 2
      t.integer :user_rating_count_for_current_version
      t.string :track_content_rating
      t.decimal :average_user_rating, :precision => 10, :scale => 2
      t.integer :user_rating_count
      t.integer :rank
      
      t.timestamps
    end
  end
  
end