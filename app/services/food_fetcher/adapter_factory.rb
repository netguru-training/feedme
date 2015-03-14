module FoodFetcher
  class AdapterFactory

    def return_adapter(name)
      case name
      when grzesznicy then
        FoodFetcher::Grzesznicy.new
      when pyszne
        FoodFetcher::Pyszne.new
      else
        raise "Missing adapter for name #{name}"
      end
    end

  end
end
