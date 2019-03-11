class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  # has_many :location_reviews
end
