class OrderItemsController < ApplicationController
  load_and_authorize_resource

  def create
    product = Product.find(params[:product_id])
    order = current_user.active_order
    order_item = OrderItem.new(food_order: order, product: product)
    if order_item.save
      redirect_to products_path, notice: "Added product to order"
    else
      redirect_to products_path, alert: "Error with adding product"
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    if order_item.destroy
      redirect_to food_orders_path, notice: "Removed product from order"
    else
      redirect_to food_orders_path, alert: "Error with removing product"
    end
  end
end
