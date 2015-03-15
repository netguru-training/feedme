require 'rails_helper'

RSpec.describe Product, type: :model do

  describe '#average_rating' do
    let(:user)    { FactoryGirl.create(:user) }
    let(:product) { FactoryGirl.create(:product) }
    let(:review1) { FactoryGirl.create(:rating, value: 2, user: user, product: product) }
    let(:review2) { FactoryGirl.create(:rating, value: 3, user: user, product: product) }

    before do
      product.ratings << [review1, review2]
    end

    it 'calculates average rating' do
      expect(product.average_rating).to eq 2.5
    end
  end
  describe "#favourite" do
    before do
      @product = create(:product)
      @user = create(:user)
    end
    it "returns true if product is marked as favourite by user" do
      create(:favourite_product, product: @product, user: @user)
      expect(@product.favourite(@user.id)).to eq true
    end
    it "returns false if product is not marked as favourite by user" do
      expect(@product.favourite(@user.id)).to eq false
    end
  end
end
