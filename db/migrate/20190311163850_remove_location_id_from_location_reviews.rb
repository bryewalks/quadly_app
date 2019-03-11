class RemoveLocationIdFromLocationReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :location_reviews, :location_id, :integer
  end
end
