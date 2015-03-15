class FoodsController < ApplicationController
  before_action :authenticate_admin_user!
  respond_to :html

  def index
  end

  def fetch
    status, quantity = FoodFetcher::FoodFetcherFactory.new.fetch_food_and_save(web_name: params[:restaurant])
    if status
      redirect_to products_path, notice: "#{quantity} foods position has been fetched"
    else
      redirect_to products_path, notice: 'Sorry something went wrong'
    end
  end

  private

  def food_params
    params.require(:food).permit(:web_name)
  end

end
