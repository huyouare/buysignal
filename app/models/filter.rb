class Filter < ActiveRecord::Base
  attr_accessible :keyword, :cpl

  belongs_to :query
  validates :query_id, presence: true
end
	