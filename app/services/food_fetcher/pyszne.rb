require 'open-uri'

module FoodFetcher
  class Pyszne
    def fetch_food
      page = Nokogiri::HTML(open("https://pyszne.pl/pracownia-pizzy-rzeszow#!"))
      page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr').each do |tr_position|
        name = tr_position.children[3].text.scan(/\w+/).join(' ')
        price = page.css('div.yd-latebinding.yd-jig-menu-meal-add.tr')[0].children[3].text.match(/\d+.\d+/) 
        Product.create(price: price, name: name)
      end 
    end
  end
end
