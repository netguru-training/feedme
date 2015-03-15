class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :food_order

  delegate :name, :price, to: :product
end
