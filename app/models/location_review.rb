class LocationReview < ApplicationRecord
  belongs_to :user_location
  has_one :location, through: :user_location
  has_one :user, through: :user_location
end
