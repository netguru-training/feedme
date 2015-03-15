module FoodFetcher
  class FoodFetcherFactory

    def fetch_food_and_save(web_name: nil)
      adapter = FoodFetcher::AdapterFactory.new.return_adapter(web_name)
      adapter.fetch_food_and_save
    end

  end
end
