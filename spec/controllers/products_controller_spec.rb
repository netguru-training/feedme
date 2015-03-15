require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

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
