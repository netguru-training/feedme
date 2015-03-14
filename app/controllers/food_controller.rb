class FoodController < ApplicationController

  def fetch_food
    FoodFetchers::FoodFetchersFactory.fetch_food(web_name: params[:web_name])
  end

  private

  def itinerary_params
    params.require(:food).permit(:web_name)
  end

end
