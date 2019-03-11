class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :drones
  has_many :user_locations
  has_many :locations, through: :user_locations
  has_many :location_reviews, through: :user_locations
end
