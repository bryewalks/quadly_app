class AddDefaultFavoriteToDrones < ActiveRecord::Migration[5.2]
  def change
    change_column :drones, :favorite, :boolean, default: false
  end
end
