class ProductsController < ApplicationController

  def index
    @search = Product.search(params[:q])
    @products = @search.result
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

end