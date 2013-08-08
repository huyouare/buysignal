class Query < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  belongs_to :user
  validates :user_id, presence: true

  has_many :results, :dependent => :destroy
  has_many :filters, :dependent => :destroy
end
