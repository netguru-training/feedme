require 'rails_helper'

describe "FoodFetcher Restaurant" do
  pyszne = FoodFetcher::Pyszne.new
  grzesznicy = FoodFetcher::Grzesznicy.new

  shared_examples_for 'saves fetched products' do |restaurant|
    describe "#fetch_food_and_save" do
      it "creates products" do
        expect{ restaurant.fetch_food_and_save }.to change{ Product.count }
      end
      it "changes products" do
        restaurant.fetch_food_and_save
        expect(Product.first.last_version).to be true
        restaurant.fetch_food_and_save
        expect(Product.last.last_version).to be false
      end
    end
  end

  describe "Pyszne" do
    it_behaves_like "saves fetched products",  pyszne
  end

  describe "Grzesznicy" do
    it_behaves_like "saves fetched products", grzesznicy
  end

end
