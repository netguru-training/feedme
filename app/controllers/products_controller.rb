class ProductsController < ApplicationController
  load_and_authorize_resource :only => [:favourite, :unfavourite]


  def index
    @products = Product.last_version.where(restaurant_id: restaurants)
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

  def favourite
    @product = Product.find(params[:product_id])
    if current_user.favourite_products.find_by_product_id(@product.id).nil?
      current_user.favourite_products.create(product: @product)
      redirect_to products_path, notice: "#{@product.name} has been added to favourites"
    else
      redirect_to products_path, notice: "#{@product.name} already added to favourites"

    end
  end


  def unfavourite
    @product = Product.find(params[:product_id])
    @product_to_unfavourite = current_user.favourite_products.find_by_product_id(@product.id)
    if !@product_to_unfavourite.nil? && @product_to_unfavourite.destroy
      redirect_to products_path, notice: "#{@product.name} has been removed from favourites"
    else
      redirect_to products_path, notice: "#{@product.name} was not in favourites list"
    end
  end


end
