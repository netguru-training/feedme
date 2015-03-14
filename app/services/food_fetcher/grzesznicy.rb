require 'open-uri'

module FoodFetcher
  class Grzesznicy

    def fetch_food
      # binding.pry
      page = Nokogiri::HTML(open("http://www.grzesznicy.eu/menu.html"))
      # binding.pry
      2+2
    end

  end
end
