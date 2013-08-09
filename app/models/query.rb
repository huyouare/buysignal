class Query < ActiveRecord::Base
  attr_accessible :name, :zip_code, :radius, :max_spending, :notifications, :filters_attributes

  validates :name, presence: true

  belongs_to :user
  validates :user_id, presence: true

  has_many :results, :dependent => :destroy
  has_many :filters, :dependent => :destroy
  accepts_nested_attributes_for :filters
end
