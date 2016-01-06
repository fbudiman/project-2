# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.create(title: 'Fried Rice', user_id: 7, restaurant_id: 4, body: "Fry some rice. Add hot sauce")
Recipe.create(title: 'Fried Noodles', user_id: 9, restaurant_id: 4, body: "Fry some noodles. Add hot sauce")
