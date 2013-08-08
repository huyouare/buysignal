class Result < ActiveRecord::Base
  attr_accessible :json, :text, :id, :created_at, :updated_at, :is_buysignal, :id_str, :html
  validates :json, presence: true

  belongs_to :query
  validates :query_id, presence: true
end
