class AddColumnsToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :lat, :decimal, default: nil
    add_column :restaurants, :lon, :decimal, default: nil
  end
end
