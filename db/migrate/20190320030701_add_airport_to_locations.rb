class AddAirportToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :airport, :boolean, :default => false
  end
end
