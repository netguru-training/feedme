require 'rails_helper'

describe FoodFetcher::FoodFetcherFactory do
  shared_examples_for 'saves fetched products' do |restaurant|
    describe "#fetch_food" do
      let(:subject) { FoodFetcher::FoodFetcherFactory.new }
      it "fetchs food and returns them size" do
        expect(subject.fetch_food_and_save(web_name: restaurant)).to match_array [true, Restaurant.find_by_name(restaurant.capitalize).products.size]
      end
    end
  end

  describe "Pyszne" do
    it_behaves_like "saves fetched products",  "pyszne"
  end

  describe "Grzesznicy" do
    it_behaves_like "saves fetched products", "grzesznicy"
  end

  describe "other" do
    it "returns missing object error" do
      expect{ subject.fetch_food_and_save(web_name: "other") }.to raise_error(FoodFetcher::AdapterFactory::MissingFoodObjectError)
    end
  end
end
