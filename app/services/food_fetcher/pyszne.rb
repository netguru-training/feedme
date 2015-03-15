require 'open-uri'

module FoodFetcher
  class Pyszne
    RESTAURANT_NAME = 'Pyszne'

    def fetch_food_and_save
      Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.map{ |product| product.update_attributes(last_version: false)}
      page = Nokogiri::HTML(open("https://pyszne.pl/pracownia-pizzy-rzeszow#!"))
      Product.transaction do
        page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr').each do |product|
          name = product.children[1].text.scan(/\w+/).join(' ')
          price = page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr')[0].children[3]
          .text.match(/\d+.\d+/).to_s.to_f
          Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.create(price: price.to_f, name: name, last_version: true)
        end
      end
      return true, Restaurant.find_or_create_by(name: RESTAURANT_NAME).products.last_version.size
    end
  end
end
