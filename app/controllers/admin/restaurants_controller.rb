module Admin
  class RestaurantsController < ApplicationController
    before_action :authenticate_admin_user!

    def index
      @restaurants = Restaurant.all
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    def new
      @restaurant = Restaurant.new
    end

    def edit
      @restaurant = Restaurant.find(params[:id])
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)

      if @restaurant.save
        redirect_to admin_restaurnats_path(@restaurant)
      else
        render 'new'
      end
    end

    def update
      @restaurant = Restaurant.find(params[:id])

      if @restaurant.update(restaurnat_params)
        redirect_to admin_restaurnats_path(@restaurant)
      else
        render 'edit'
      end
    end
    private
    def restaurant_params
      params.require(:restaurant).permit(:name, :phone_number)
    end
  end
end