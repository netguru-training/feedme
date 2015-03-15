require 'rails_helper'

RSpec.describe Product, type: :model do
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
