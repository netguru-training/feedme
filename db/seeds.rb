# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: 'Pizza', price: 10.10, restaurant_id: 1)
Product.create(name: 'Grilled tomatoes', price: 5, restaurant_id: 1)
Product.create(name: 'Smoked Wolf', price: 12, restaurant_id: 2)
Restaurant.create(name: 'Pizza Hut', lat: 50.038005, lng: 21.996696, address: "Rzeszow Hetmanska 11")
Restaurant.create(name: 'Chatka Babuni', lat: 52.406223, lng: 16.932708, address: "Poznań Wrocławska 18")

User.create(email: 'admin@feedme.pl', password: 'password', admin: true)
User.create(email: 'user@feedme.pl', password: 'password', admin: false)
