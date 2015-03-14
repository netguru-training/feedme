require 'spec_helper'

describe  FoodFetcher::Pyszne do
  describe "#fetch_food_and_save" do
    subject { FoodFetcher::Pyszne.new }
    it 'saves fetched products' do
      VCR.use_cassette('pyszne') do
        expect{ subject.fetch_food_and_save }.to change{ Product.count }.by(2)
      end
    end
  end
end
