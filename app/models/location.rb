class Location < ApplicationRecord
  has_many :weathers
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :location_reviews, through: :user_locations
  enum flight_zone_status: {no_flight_zone: 0, flight_zone: 1, requires_authorization: 2}
end
