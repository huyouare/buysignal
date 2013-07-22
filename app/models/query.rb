class Query < ActiveRecord::Base
  attr_accessible :description, :keyword

  validates :keyword, presence: true
end
