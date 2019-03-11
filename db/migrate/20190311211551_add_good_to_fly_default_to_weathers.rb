class AddGoodToFlyDefaultToWeathers < ActiveRecord::Migration[5.2]
  def change
    change_column :weathers, :good_to_fly, :boolean, :default => false
  end
end
