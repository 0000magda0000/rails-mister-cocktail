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

file1 = URI.open('https://www.gernekochen.de/wp-content/uploads/2019/12/saft-cocktail-rezept-gernekochen-silvester-alkoholfrei-9-scaled.jpg')
file2 = URI.open('https://mixology.eu/wp-content/uploads/2012/11/Airmail-TITEL.jpg')

cocktail1 = Cocktail.new(name: Faker::FunnyName.two_word_name)
cocktail2 = Cocktail.new(name: Faker::FunnyName.two_word_name)

cocktail1.photo.attach(io: file1, filename: 'cocktail1.jpg', content_type: 'image/jpg')
cocktail2.photo.attach(io: file2, filename: 'cocktail2.jpg', content_type: 'image/jpg')

cocktail1.save
cocktail2.save

puts "creating doses"
2.times do
  Dose.create!(description: Faker::Food.description, ingredient: Ingredient.all.sample, cocktail: Cocktail.all.sample)
end
puts "Created 2 cocktails!"
