require 'spec_helper'
include Devise::TestHelpers

RSpec.describe FoodsController, type: :controller do

  describe FoodsController do
    describe '#fetch' do
      context 'when passed correct web name' do
        before do
          sign_in FactoryGirl.create(:admin)
        end

        subject { get :fetch, {web_name: 'web'} }        

        it 'reesponds with an http 200 status' do
          ::FoodFetcher::FoodFetcherFactory.any_instance.stub(:fetch_food_and_save).and_return(true, '10')
          expect(subject).to redirect_to(products_url)
        end
      end
    end
  end

end
