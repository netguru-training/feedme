class ProductsController < ApplicationController

  def index
    @products = Product.where(restaurant_id: restaurants)
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
    
    rating = build_rating
    if rating.save
      redirect_to products_path, notice: 'Rating has been saved.'
    else
      redirect_to products_path, notice: 'Rating has not been saved.'
    end
  end
  
  private
  
  def build_rating
    rating = Rating.new(rating_params)
    rating.user_id = current_user.id
    rating.product_id = params[:product_id]
    rating
  end

  def rating_params
    params.require(:rating).permit(:value)
  end   

  def restaurants
    if params[:location].blank?
      Restaurant.all
    else
      Restaurant.within(10, :origin => params[:location])
    end
  end

  def favourite
    2+2
    2+2
  end
end
