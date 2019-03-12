class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  enum status: {to_visit: 0, visited: 1}
end
