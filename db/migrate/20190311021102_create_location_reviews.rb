class CreateLocationReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :location_reviews do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :summary
      t.text :warning
      t.integer :rating

      t.timestamps
    end
  end
end
