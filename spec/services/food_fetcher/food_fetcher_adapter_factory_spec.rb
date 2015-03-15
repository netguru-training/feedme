require 'rails_helper'

describe FoodFetcher::AdapterFactory do
  describe "#return_adapter" do
    context "when object exists" do
      let(:subject) { FoodFetcher::AdapterFactory.new }
      context "grzesznicy" do
        it "creates new grzesznicy class" do
          expect(subject.return_adapter("grzesznicy").class).to eq FoodFetcher::Grzesznicy
        end
      end
      context "pyszne" do
        it "creates new pyszne class" do
          expect(subject.return_adapter("pyszne").class).to eq FoodFetcher::Pyszne
        end
      end
      context "other" do
        it "raise error" do
          expect{ subject.return_adapter("other") }.to raise_error(FoodFetcher::AdapterFactory::MissingFoodObjectError)
        end
      end
    end
  end
end
