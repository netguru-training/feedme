require 'rails_helper'

describe FoodOrder do

  describe "#finalize!" do
    let(:order) { FactoryGirl.create :food_order, status: :active }
    let(:time) { Time.new(2012, 8, 29, 22, 35, 0) }

    it "sets status to finalized" do
      order.finalize!
      expect(order.status).to eq("finalized")
    end

    it "sets finalized_at" do
      Time.stub(:now) { time }
      order.finalize!
      expect(order.finalized_at).to eq(time)
    end
  end
end
