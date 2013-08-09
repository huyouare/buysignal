require 'twitter'
require 'json'

json_tweets = [] 
text = File.open('tweets.json').read
text.each_line do |line|
	json_tweets << line
end

id_str = []
json_tweets.each do |x|
	tweet = JSON.parse(x)
	id = tweet['id_str']
	unless id.nil? or id.empty?
		id_str << tweet['id_str']
	end
end


Twitter.configure do |config|
  config.consumer_key       = 'JAIrNZ1nzY4b8v5StuW9Mw'
  config.consumer_secret    = '2BzB6CcPRGVFIjWdLcvjJx5zdTLbEwpHxu5S5h0M'
  config.oauth_token        = '1491888716-SFSFcONtaTw0OHkuGQVlLNGcacvxfq6OhU4lwxd'
  config.oauth_token_secret = '1dCP0Kka3rvkx5ZuH3pXvZLQfNUzUhEU5nD3JsVBjw'
end

id_str.each do |id|
	begin
		unless id.nil? or id.empty?
			status = Twitter.oembed(id.to_i)
			puts status.html
		end

	rescue
	end
end