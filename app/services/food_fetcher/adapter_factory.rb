module FoodFetcher
  class AdapterFactory

    def return_adapter(name)
      FoodFetcher.const_get(name.capitalize).new rescue raise "Missing adapter for name #{name}"
    end

  end
end
