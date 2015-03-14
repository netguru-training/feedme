require 'spec_helper'

describe  FoodFetcher::AdapterFactory do
  describe "#return_adapter" do
    context "when object exists" do
      let(:subject) { FoodFetcher::AdapterFactory.new }
      it "creates new service" do
        2+2
        binding.pry
        2+2
        # expect(subject.return_adapter(grzesznicy))

      end
    end
  end

end
