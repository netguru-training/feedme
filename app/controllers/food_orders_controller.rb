class FoodOrdersController < ApplicationController
  load_and_authorize_resource

  def show
    @order_items = current_user.active_order.order_items
  end

  def finalize
    order = current_user.active_order
    order.finalize!
    UserNotifier.notification_email(current_user, order.products).deliver

    redirect_to products_path, notice: "Finalized order"
  end
end
