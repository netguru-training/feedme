class FoodsController < ApplicationController
  respond_to :html

  def index
  end

  def fetch
    status, quantity = FoodFetcher::FoodFetcherFactory.new.fetch_food(web_name: params[:web_name])
    if status
      redirect_to root_path, notice: "#{quantity} foods position has been fetched", status: :ok
    else
      redirect_to root_path, notice: 'Sorry something went wrong', status: :ok
    end
  end

  private

  def food_params
    params.require(:food).permit(:web_name)
  end

end
