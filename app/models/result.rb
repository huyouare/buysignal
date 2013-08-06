class Result < ActiveRecord::Base
  attr_accessible :json, :text
  validates :json, presence: true

  belongs_to :query
  validates :query_id, presence: true
end
