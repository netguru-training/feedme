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
end
