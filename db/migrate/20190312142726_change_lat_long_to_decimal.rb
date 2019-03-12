class ChangeLatLongToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :latitude, :decimal, {:precision=>10, :scale=>6}
    change_column :locations, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
