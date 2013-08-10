# require 'tweetstream'

# root = File.expand_path(File.join(File.dirname(__FILE__), '.'))
# require File.join(root, "config", "environment")

# TweetStream.configure do |config|
#   config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
#   config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
#   config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
#   config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
#   config.auth_method        = :oauth
# end

# daemon = TweetStream::Daemon.new('tracker', :log_output => true)
# daemon.on_inited do
#   ActiveRecord::Base.connection.reconnect!
#   ActiveRecord::Base.logger = Logger.new(File.open('log/stream.log', 'w+'))
# end

# daemon.track('buy') do |status|
#   puts "#{status.text}"
# end