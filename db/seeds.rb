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
end

puts "created #{Ingredient.all.count} ingredients"

Cocktail.destroy_all
puts "Cocktails destroyed"

10.times do
  new_cocktail = Cocktail.new(name: Faker::FamilyGuy.character)
  url = "https://images.unsplash.com/photo-1438522014717-d7ce32b9bab9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=55cb1a59dd5a3cecf474342bc3048ea7&auto=format&fit=crop&w=1349&q=80"
  new_cocktail.remote_photo_url = url
  new_cocktail.save
end

puts "created #{Cocktail.all.count} cocktails"


Dose.destroy_all
puts "Doses destroyed"

Cocktail.all.each do |cocktail|
  3.times do
    Dose.create(description: "1 shot", cocktail: cocktail, ingredient: Ingredient.all.sample)
  end
end

puts "Created #{Dose.all.count} doses"
