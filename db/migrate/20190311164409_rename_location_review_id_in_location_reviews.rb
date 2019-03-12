class RenameLocationReviewIdInLocationReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :location_reviews, :location_review_id, :user_location_id
  end
end
