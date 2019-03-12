class RemoveUserIdFromLocationReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :location_reviews, :user_id, :integer
  end
end
