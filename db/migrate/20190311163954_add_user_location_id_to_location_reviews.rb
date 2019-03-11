class AddUserLocationIdToLocationReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :location_reviews, :location_review_id, :integer
  end
end
