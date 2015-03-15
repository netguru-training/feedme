class AddLngToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lng, :float
  end
end
