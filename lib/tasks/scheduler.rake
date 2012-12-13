require 'open-uri'

desc "This will update the Top Apps and add New Apps to be run by the Heroku Scheduler"
task :seed_data => :environment do
  puts "*"*50
  puts "ADDING/UPDATING TOP 300 FREE APPS"
  puts "*"*50
  Rake::Task["add:apps"].execute({amount: 300, type: "topfree"})
  puts "*"*50
  puts "ADDING/UPDATING TOP 300 PAID APPS"
  puts "*"*50
  Rake::Task["add:apps"].execute({amount: 300, type: "toppaid"})
  puts "*"*50
  puts "ADDING/UPDATING 300 NEW APPS"
  puts "*"*50
  Rake::Task["add:apps"].execute({amount: 100, type: "new"})
  puts "*"*50
  puts "DONE."
end