class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :location_reviews
  enum status: {to_visit: 0, visited: 1}
end
