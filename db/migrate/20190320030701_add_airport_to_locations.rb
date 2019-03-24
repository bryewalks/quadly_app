class AddAirportToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :airport, :integer, :default => 0
  end
end
