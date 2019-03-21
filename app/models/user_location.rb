class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :location_reviews
  validates_uniqueness_of :user_id, :scope => :location_id
  enum status: {to_visit: 0, visited: 1}
end
