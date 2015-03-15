require 'rails_helper'

describe FoodFetcher::Pyszne do
  describe "#fetch_food_and_save" do
    subject { FoodFetcher::Pyszne.new }
    it 'saves fetched products' do
      expect{ subject.fetch_food_and_save }.to change{ Product.count }
    end
  end
end
