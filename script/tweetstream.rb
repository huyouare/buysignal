require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
  config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
  config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
  config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
  config.auth_method        = :oauth
end

# require 'twitter'

# Twitter.configure do |config|
#   config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
#   config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
#   config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
#   config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
# end

count = 0
puts "Stream Begin"
# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.
TweetStream::Client.new.track('buy', 'buying') do |status, client|
  tweet = User.first.queries.first.results.new
  tweet.text = status.text
  tweet.json = status.attrs
  tweet.id_str = status.id_str
  puts tweet.text
  puts tweet.id_str

  # oembed = Twitter.oembed(tweet.id_str.to_i)
  # puts oembed.html
  # tweet.html = oembed.html

  # tweet.save
  count = count + 1
  puts count
  client.stop if count >= 25
end

puts "Stream End"