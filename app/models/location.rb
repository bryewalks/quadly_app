class Location < ApplicationRecord
  has_many :weathers
  has_many :user_locations, dependent: :destroy
  has_many :users, through: :user_locations
  has_many :location_reviews, dependent: :destroy, through: :user_locations
  enum flight_zone_status: {no_flight_zone: 0, flight_zone: 1, requires_authorization: 2}
  enum airport: {no_airport: 0, large_airport: 1, small_airport: 2}
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # reverse_geocoded_by :latitude, :longitude
  #   # :address => :location
  # after_validation :reverse_geocode

  def check_airports
    self.nearbys(5).where(airport: 1).length > 0
  end

  def check_small_airports
    self.nearbys(5).where(airport: 2).length > 0
  end

  def determine_status
    if self.latitude && self.longitude && check_airports
      self.flight_zone_status = "no_flight_zone"
    elsif self.latitude && self.longitude && check_small_airports
      self.flight_zone_status = "requires_authorization"
    else
      self.flight_zone_status = "flight_zone"
    end
  end

end
