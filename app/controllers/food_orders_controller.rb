class FoodOrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = current_user.food_orders
  end

  def show
    @order = FoodOrder.find(params[:id])
  end

  def finalize
    order = current_user.active_order
    order.finalize!
    UserNotifier.notification_email(current_user, order.products).deliver

    redirect_to food_orders_path, notice: "Finalized order"
  end
end
