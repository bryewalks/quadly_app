class Drone < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :status, presence: true

  enum status: {flyable: 0, fixable: 1, trash: 2}
end
