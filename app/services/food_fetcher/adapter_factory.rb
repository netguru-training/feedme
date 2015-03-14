module FoodFetcher
  class AdapterFactory
    class MissingFoodObjectError < StandardError; end

    def return_adapter(name)
      FoodFetcher.const_get(name.capitalize).new
    rescue NameError => e
      raise MissingFoodObjectError
    end

  end
end
