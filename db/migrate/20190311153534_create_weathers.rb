class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.boolean :good_to_fly
      t.integer :wind_speed
      t.integer :temperature
      t.integer :visibility_miles
      t.integer :max_gust_speed
      t.integer :chance_of_precipitation
      t.integer :cloud_cover
      t.integer :wind_direction
      t.integer :location_id

      t.timestamps
    end
  end
end
