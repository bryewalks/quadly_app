class AddStatusToUserLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_locations, :status, :integer
  end
end
