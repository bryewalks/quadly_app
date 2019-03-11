class Weather < ApplicationRecord
  belongs_to :location
  enum wind_direction: {north: 0, north_east: 1, east: 2, south_east: 3, south: 4, south_west: 5, west: 6, north_west: 7}
end
