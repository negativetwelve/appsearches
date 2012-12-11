class App < ActiveRecord::Base
  attr_accessible :kind, :features, :supported_devices, :is_gamecenter_enabled, :artist_view_url, :artwork_url_60, 
                  :screenshot_urls, :ipad_screenshot_urls, :artwork_url_512, :artist_id, :artist_name, :price, 
                  :version, :description, :genre_ids, :release_date, :seller_name, :currency, :genres, :bundle_id, :track_id,
                  :track_name, :primary_genre_name, :genre_id, :release_notes, :wrapper_type, :content_advisory_rating, 
                  :artwork_url_100, :track_censored_name, :track_view_url, :language_codes, :file_size_bytes, :formatted_price,
                  :average_user_rating_for_current_version, :user_rating_count_for_current_version, :track_content_rating, 
                  :average_user_rating, :user_rating_count, :rank
  
  serialize :features, Array
  serialize :supported_devices, Array
  serialize :screenshot_urls, Array
  serialize :ipad_screenshot_urls, Array
  serialize :genre_ids, Array
  serialize :genres, Array
  serialize :language_codes, Array
  
  # for paginating
  self.per_page = 20
  
end
