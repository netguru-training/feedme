class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references  :product, index: true, null: false
      t.references  :user, index: true, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
