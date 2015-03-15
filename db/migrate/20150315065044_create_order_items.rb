class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.references :food_order, index: true

      t.timestamps null: false
    end
    add_foreign_key :order_items, :products
    add_foreign_key :order_items, :food_orders
  end
end
