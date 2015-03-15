class ProductsController < ApplicationController

  def index
    @products = Product.where(restaurant_id: restaurants)
    @search = @products.search(params[:q])
    @products = @search.result
    @search_tag_value = params[:location]
  end

  def show
    @product = Product.find(params[:id])
  end

  def restaurants
    if params[:location].blank?
      Restaurant.all
    else
      Restaurant.within(10, :origin => params[:location])
    end
  end

end