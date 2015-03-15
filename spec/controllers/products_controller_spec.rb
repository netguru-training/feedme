require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET index' do
    before do
      create_list :product, 3, restaurant_id: gdansk_restaurant.id
    end

    let(:rzeszow_restaurant) do
      create :restaurant,
        name: "Pizzahut", address: "Rzeszow Hetmanska", lat: 50.038005, lng: 21.996696
    end
    let(:gdansk_restaurant) do
      create :restaurant,
        name: "Chatka Puchatka", address: "Gdansk", lat: 1, lng: 1
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
    it 'assigns @products' do
      get :index
      expect(assigns(:products)).to match_array(Product.all)
    end

    it 'filters @products by location' do
      create_list :product, 2, restaurant_id: rzeszow_restaurant.id
      get :index, {location: 'rzeszow'}
      expect(assigns(:products).count).to eq 2
    end

    it 'filters @products by product name' do
      create :product, name: "frytki", restaurant_id: gdansk_restaurant.id
      get :index, {q: { name_cont: 'frytki'} }
      expect(assigns(:products).count).to eq 1
    end
  end
  describe 'POST ratings' do
    let(:product) { FactoryGirl.create :product }
    let(:user) { FactoryGirl.create :user }

    subject { post :ratings, { product_id: product.id, rating: {value: 5} } }

    before do
      sign_in user
    end

    context 'when product has not been rated by user' do
      it 'creates new rate for product' do
        expect{ subject }.to change{product.ratings.count}.by(1)
      end
    end

    context 'when product has been rated by user allready' do
      before do
        subject
      end

      it 'creates new rate for product' do
        expect{ subject }.to change{product.ratings.count}.by(0)
      end
    end
  end

  describe "POST favourite/unfavourite" do
    before do
      @product = create(:product)
      @user = create(:user)
    end

    context "user logged in" do
      before do
        sign_in @user
      end
      describe "#favourite" do
        it "adds product to favourite if not added before" do
          expect { post :favourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by 1
        end
        it "doesn't adds product to favourite if added before" do
          post :favourite, { product_id: @product.id }
          expect { post :favourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by 0
        end
      end
      describe "#unfavourite" do
        it "deletes product from favourites if added to favourites before" do
          create(:favourite_product, product: @product, user: @user)
          expect { post :unfavourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by -1
        end
        it "doesn't delete product from favourites if not added to favourites before" do
          expect { post :unfavourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by 0
        end
      end
    end
    context "user not logged in" do
      before do
        sign_out @user
      end
      describe "#favourite" do
        it "doesn't change favourite products" do
          expect { post :favourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by 0
        end
      end
      describe "#unfavourite" do
        it "doesn't change favourite products" do
          create(:favourite_product, product: @product, user: @user)
          expect { post :unfavourite, { product_id: @product.id } }.to change(FavouriteProduct, :count).by 0
        end
      end
    end
  end
end
