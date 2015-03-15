class ProductsController < ApplicationController

  def index
    @products = Product.where(restaurant_id: restaurants)
    @search = @products.search(params[:q])
    @products = @search.result
  end

  def show
    @product = Product.find(params[:id])
  end

  def restaurants
    if params[:location].empty?
      Restaurant.all
    else
      Restaurant.within(10, :origin => params[:location])
    end
  end

end