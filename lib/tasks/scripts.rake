require 'open-uri'

namespace :seed do
  task apps: :environment do
    puts "*"*50
    puts "ADDING TOP 300 FREE APPS"
    puts "*"*50
    Rake::Task["add:top_apps"].execute({amount: 300, type: "free"})
    puts "*"*50
    puts "ADDING TOP 300 PAID APPS"
    puts "*"*50
    Rake::Task["add:top_apps"].execute({amount: 300, type: "paid"})
  end
end

namespace :get do
  task :top_free_apps do
    puts get_top_free_apps(10)
  end
  
  task :top_music do
    num = 300
    count = 1
    music = get_top_music(num)
    music.each do |id|
      puts "#{count}. #{find_by_id(id)["results"][0]["trackName"]}"
      count += 1
    end
  end
end

namespace :find do
  task :by_id, :id do |t, args|
    app = find_by_id(args[:id])["results"][0]
    app.each do |key, value|
      puts "#{key} : #{value}"
    end
  end
end

namespace :add do
  task :by_id, [:id] => :environment do |t, args|
    app = find_by_id(args[:id])["results"][0]
    puts "Adding to db...."
    add_app_to_db(app, nil)
    puts "Done."
  end
  
  task :top_apps, [:amount, :type] => :environment do |t, args|
    puts "Getting apps..."
    if args[:type] == "free"
      apps = get_top_free_apps(args[:amount])
    elsif args[:type] == "paid"
      apps = get_top_paid_apps(args[:amount])
    else
      puts "Invalid parameters, specify the amount and the type. Ex: rake add:top_apps[300,free]"
      return
    end
    puts "Adding apps..."
    apps.each_with_index do |(id, pic), index|
      app = find_by_id(id)["results"][0]
      add_app_to_db(app, index+1, pic)
    end
    puts "Done."
  end

end

def get_top_free_apps(amount)
  address = "https://itunes.apple.com/us/rss/topfreeapplications/limit=#{amount}/xml"
  results = Nokogiri::XML(open(address))
  ids = results.css("entry id").map{|x| x.attributes["id"].value}
  pics = results.css("entry").map{|item| item.children[27].children[0].text}
  hash = Hash[ids.zip(pics)]
end

def get_top_paid_apps(amount)
  address = "https://itunes.apple.com/us/rss/toppaidapplications/limit=#{amount}/xml"
  results = Nokogiri::XML(open(address))
  ids = results.css("entry id").map{|x| x.attributes["id"].value}
  pics = results.css("entry")[0].children[27].children[0].text
  hash = Hash[ids.zip(pics)]
end

def get_top_music(amount)
  address = "https://itunes.apple.com/us/rss/topsongs/limit=#{amount}/explicit=true/xml"
  results = Nokogiri::XML(open(address))
  ids = results.css("entry id").map{|x| x.attributes["id"].value}
end

def find_by_id(id)
  address = "http://itunes.apple.com/lookup?id=#{id}"
  resp = Net::HTTP.get_response(URI.parse(address))
  data = resp.body
  return JSON.parse(data)
end

def add_app_to_db(app, rank, pic)
  db_app = App.find_by_track_id(app["trackId"].to_i)
  if db_app.nil?
    new_app = App.create!(kind: app["kind"], features: app["features"], supported_devices: app["supportedDevices"], 
                        is_gamecenter_enabled: app["isGameCenterEnabled"], artist_view_url: app["artistViewUrl"], 
                        artwork_url_60: app["artworkUrl60"], screenshot_urls: app["screenshotUrls"], 
                        ipad_screenshot_urls: app["ipadScreenshotUrls"], artwork_url_512: app["artworkUrl512"], 
                        artist_id: app["artistId"], artist_name: app["artistName"], price: app["price"], 
                        version: app["version"], description: app["description"], genre_ids: app["genreIds"], 
                        release_date: app["releaseDate"], seller_name: app["sellerName"], currency: app["currency"], 
                        genres: app["genres"], bundle_id: app["bundleId"], track_id: app["trackId"], track_name: app["trackName"], 
                        primary_genre_name: app["primaryGenreName"], genre_id: app["primaryGenreId"], 
                        release_notes: app["releaseNotes"], wrapper_type: app["wrapperType"], 
                        content_advisory_rating: app["contentAdvisoryRating"], artwork_url_100: pic, 
                        track_censored_name: app["trackCensoredName"], track_view_url: app["trackViewUrl"], 
                        language_codes: app["languageCodesISO2A"], file_size_bytes: app["fileSizeBytes"], 
                        formatted_price: app["formattedPrice"], average_user_rating_for_current_version: app["averageUserRatingForCurrentVersion"], 
                        user_rating_count_for_current_version: app["userRatingCountForCurrentVersion"], 
                        track_content_rating: app["trackContentRating"], average_user_rating: app["averageUserRating"], 
                        user_rating_count: app["userRatingCount"], rank: rank)
    puts "Added #{app["trackName"]}"
  else
    db_app.rank = rank
    db_app.save
    puts "Updated #{db_app.track_name}"
  end
end
