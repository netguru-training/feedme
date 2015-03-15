class AddFavouritesProductsForUser < ActiveRecord::Migration
  def change
    create_table :favourite_products do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
