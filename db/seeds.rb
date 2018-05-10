# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'


Ingredient.destroy_all
puts "Ingredients destroyed"

drinks_json = File.read('/home/jake/code/JakeTompkins/rails-mister-cocktail/db/ingredients.json')
json = JSON.parse(drinks_json)
drinks = json["drinks"]
drinks.each do |d|
  Ingredient.create(name:d.values[0])
  puts "#{Ingredient.last.name} created"
end

puts "created #{Ingredient.all.count} ingredients"
