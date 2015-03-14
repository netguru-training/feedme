require 'spec_helper'

RSpec.describe FoodsController, type: :controller do
  
  describe FoodsController do
    describe '#fetch' do
      context 'when passed correct web name' do
        it 'reesponds with an http 200 status' do
          ::FoodFetcher::FoodFetcherFactory.any_instance.stub(:fetch_food).and_return(true, '10')
          get :fetch, {web_name: 'web'}
          expect(response.status).to eql 200
        end
      end 
    end
  end

end
