class ProductsController < ApplicationController

  def index
    @search = Product.search(params[:q])
    @products = @search.result
  end

  def show
    @product = Product.find(params[:id])
  end

  def favourite
    2+2
    2+2
  end
end
