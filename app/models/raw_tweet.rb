class RawTweet < ActiveRecord::Base
  attr_accessible :json, :text
  validates :json	, presence: true
end
