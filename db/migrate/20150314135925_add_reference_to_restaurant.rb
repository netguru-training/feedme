class AddReferenceToRestaurant < ActiveRecord::Migration
  def change
    add_reference :products, :restaurant, index: true
  end
end
