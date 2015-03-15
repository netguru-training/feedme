class FoodOrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = @food_orders.decorate
  end

  def show
    @order = FoodOrder.find(params[:id])
  end

  def finalize
    order = current_user.active_order
    order.finalize!
    UserNotifier.finalized_email(current_user, order.products).deliver

    redirect_to food_orders_path, notice: "Finalized order"
  end

  def deliver
    order = FoodOrder.find(params[:food_order_id])
    order.deliver!
    UserNotifier.delivered_email(order.user).deliver

    redirect_to food_orders_path, notice: "Marked order as delivered"
  end
end
