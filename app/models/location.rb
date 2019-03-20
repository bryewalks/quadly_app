class Location < ApplicationRecord
  has_many :weathers
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :location_reviews, through: :user_locations
  enum flight_zone_status: {no_flight_zone: 0, flight_zone: 1, requires_authorization: 2}
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def check_airports
    self.nearbys(5).where(airport: true)
  end

  def determine_status
    if check_airports.length > 0
      self.flight_zone_status = "no_flight_zone"
    else
      self.flight_zone_status = "flight_zone"
    end
    self.save
  end

end
