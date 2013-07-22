class Query < ActiveRecord::Base
  attr_accessible :description, :keyword

  validates :keyword, presence: true

  belongs_to :user
  validates :user_id, presence: true
end
