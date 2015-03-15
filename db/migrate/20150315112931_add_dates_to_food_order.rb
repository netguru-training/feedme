class AddDatesToFoodOrder < ActiveRecord::Migration
  def change
    add_column :food_orders, :finalized_at, :datetime
    add_column :food_orders, :delivered_at, :datetime
  end
end
