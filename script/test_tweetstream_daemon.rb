require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
  config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
  config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
  config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
  config.auth_method        = :oauth
end


ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, "config", "environment")

daemon = TweetStream::Daemon.new('tweetstream', :log_output => true)
daemon.on_inited do
  ActiveRecord::Base.connection.connect!
end

count = 0
puts "Deamon Initializing..."
# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.
daemon.track('buy', 'buying') do |status|
  puts "#{status.text}"
  tweet = User.first.queries.first.results.new
  tweet.text = status.text
  tweet.json = status.attrs
  tweet.query_id = 1
  tweet.is_buysignal = true
  tweet.save
  count = count + 1
  puts count
end
ActiveRecord::Base.connection.disconnect!
puts "Daemon Finished"