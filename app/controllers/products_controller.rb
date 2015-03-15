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
    @rating = Rating.new
  end

  def ratings
    @product = Product.find(params[:product_id])
    if @product.has_rated?(current_user)
      redirect_to products_path, notice: 'You has been rated this product'
      return
    end
    unless rating_params
      return redirect_to product_path(@product), alert: 'Rating has not been saved.'
    end
    rating = build_rating
    if rating.save
      redirect_to product_path(@product), notice: 'Rating has been saved.'
    else
      redirect_to product_path(@product), alert: 'Rating has not been saved.'
    end
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
      redirect_to products_path, alert: "#{@product.name} already added to favourites"

    end
  end

  def unfavourite
    @product = Product.find(params[:product_id])
    @product_to_unfavourite = current_user.favourite_products.find_by_product_id(@product.id)
    if !@product_to_unfavourite.nil? && @product_to_unfavourite.destroy
      redirect_to products_path, notice: "#{@product.name} has been removed from favourites"
    else
      redirect_to products_path, alert: "#{@product.name} was not in favourites list"
    end
  end

  def top
    @products = Product.top
  end
  
  private

  def build_rating
    rating = Rating.new(rating_params)
    rating.user_id = current_user.id
    rating.product_id = params[:product_id]
    rating
  end

  def rating_params
    if params["rating"].nil?
      return false
    else
      params.require(:rating).permit(:value)
    end
  end

end
