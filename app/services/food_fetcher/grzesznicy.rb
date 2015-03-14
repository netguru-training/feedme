require 'open-uri'

module FoodFetcher
  class Grzesznicy

    def fetch_food_and_save
      agent = Mechanize.new
      page = agent.get("http://www.grzesznicy.eu/menu.html")
      Product.transaction do
        parse_css(page, td_row: 1)
        page.links.select { |link| /menu_\D*\S$/ =~ link.href }.each do |link|
          page = link.click
          parse_css(page)
        end
      end
    end

    def parse_css(page, td_row: 2)
      page.parser.css('tr').each do | row |
        name = row.css('strong').text
        price = row.css('td')[td_row].text.to_i
        Product.create(name: name, price: price)
      end
    end
  end
end
