class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :order_items, :products
    remove_foreign_key :order_items, :food_orders
  end
end
