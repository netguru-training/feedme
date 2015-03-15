require 'rails_helper'
include Devise::TestHelpers

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
end
