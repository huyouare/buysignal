class RawTweet < ActiveRecord::Base
  attr_accessible :json, :text
end
