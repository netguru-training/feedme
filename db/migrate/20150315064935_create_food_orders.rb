class CreateFoodOrders < ActiveRecord::Migration
  def change
    create_table :food_orders do |t|
      t.string :status
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :food_orders, :users
  end
end
