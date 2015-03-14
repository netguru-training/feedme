require 'open-uri'

module FoodFetcher
  class Grzesznicy
    RESTAURANT_NAME = 'Grzesznicy'

    def fetch_food_and_save
      Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.map{ |product| product.update_attributes(last_version: false)}
      agent = Mechanize.new
      page = agent.get("http://www.grzesznicy.eu/menu.html")
      Product.transaction do
        parse_css(page, td_row: 1)
        page.links.select { |link| /menu_\D*\S$/ =~ link.href }.each do |link|
          page = link.click
          parse_css(page)
        end
      end
      Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.last_version.size
    end

    def parse_css(page, td_row: 2)
      page.parser.css('tr').each do | row |
        name = row.css('strong').text
        price = row.css('td')[td_row].text.to_i
        Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.create(price: price.to_f, name: name, last_version: true)
      end
    end
  end
end
