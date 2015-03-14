require 'open-uri'

module FoodFetcher
  class Pyszne
    RESTAURANT_NAME = 'Pyszne'

    def fetch_food
      page = Nokogiri::HTML(open("https://pyszne.pl/pracownia-pizzy-rzeszow#!"))
      page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr').each do |product|
        name = product.children[1].text.scan(/\w+/).join(' ')
        price = page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr')[0].children[3]
          .text.match(/\d+.\d+/).to_s.to_f         
        Restaurant.find_by_name(RESTAURANT_NAME).products.create(price: price.to_f, name: name)
      end 
    end
  end
end
