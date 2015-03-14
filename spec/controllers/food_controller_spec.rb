require 'rails_helper'

RSpec.describe FoodController, type: :controller do

  describe FoodController do
    describe "#fetch_food" do
      it  'expect respond wiec an http 200 status' do
        get :fetch_food
        expect(response.status).to eql 200
      end 
    end
  end

end
