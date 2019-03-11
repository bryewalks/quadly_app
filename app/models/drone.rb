class Drone < ApplicationRecord
  belongs_to :user
  enum status: {flyable: 0, fixable: 1, trash: 2}
end
