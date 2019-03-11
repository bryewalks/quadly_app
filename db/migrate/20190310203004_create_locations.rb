class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :latitude
      t.integer :longitude
      t.integer :flight_zone_status

      t.timestamps
    end
  end
end
