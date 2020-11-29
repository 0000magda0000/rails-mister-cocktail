require 'json'
require 'open-uri'# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

puts "deleting all"
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts "creating ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink = open(url).read
ingredients = JSON.parse(drink)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "creating cocktails"
10.times do
  Cocktail.create!(name: Faker::FunnyName.two_word_name)
end

puts "creating doses"
10.times do
  Dose.create!(description: Faker::Food.description, ingredient: Ingredient.all.sample, cocktail: Cocktail.all.sample)
end
puts "Created 10 cocktails!"
