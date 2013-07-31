class Result < ActiveRecord::Base
  attr_accessible :json 
  validates :json, presence: true

  belongs_to :query
  validates :query_id, presence: true
end
