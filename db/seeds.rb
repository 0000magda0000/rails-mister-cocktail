require 'json'
require 'open-uri'# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

puts "deleting all"
Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

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
file3 = URI.open('https://www.flowersinthesalad.com/wp-content/uploads/sites/24/2018/12/grapefruit-cocktail-5-von-8.jpg')
file4 = URI.open('https://heissehimbeeren.com/wp-content/uploads/2018/09/Pink-Rose-Cocktail-8.jpg')
file5 = URI.open('https://colorsoffood.de/wp-content/uploads/2017/11/Bronx-6.jpg')
file6 = URI.open('https://www.diekuechebrennt.de/wp-content/uploads/2019/08/tequila-drinks-mai-tai-margarita.jpg')
file7 = URI.open('https://vollgut-gutvoll.de/wp-content/uploads/2018/11/Titelbild_Cocktails.png')
file8 = URI.open('https://gentlemans-attitude.de/wp-content/uploads/2020/02/vodka-soda.jpg')
file9 = URI.open('https://cdn.gutekueche.de/upload/rezept/2979/grasshopper-cocktail.jpg')
file10 = URI.open('https://vollgut-gutvoll.de/wp-content/uploads/2018/11/Titelbild_Cocktails.png')

cocktail1 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail2 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail3 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail4 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail5 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail6 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail7 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail8 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail9 = Cocktail.create!(name: Faker::FunnyName.two_word_name)
cocktail10 = Cocktail.create!(name: Faker::FunnyName.two_word_name)

cocktail1.photo.attach(io: file1, filename: 'cocktail1.jpg', content_type: 'image/jpg')
cocktail2.photo.attach(io: file2, filename: 'cocktail2.jpg', content_type: 'image/jpg')
cocktail3.photo.attach(io: file3, filename: 'cocktail3.jpg', content_type: 'image/jpg')
cocktail4.photo.attach(io: file4, filename: 'cocktail4.jpg', content_type: 'image/jpg')
cocktail5.photo.attach(io: file5, filename: 'cocktail5.jpg', content_type: 'image/jpg')
cocktail6.photo.attach(io: file6, filename: 'cocktail6.jpg', content_type: 'image/jpg')
cocktail7.photo.attach(io: file7, filename: 'cocktail7.png', content_type: 'image/png')
cocktail8.photo.attach(io: file8, filename: 'cocktail8.jpg', content_type: 'image/jpg')
cocktail9.photo.attach(io: file9, filename: 'cocktail9.jpg', content_type: 'image/jpg')
cocktail10.photo.attach(io: file10, filename: 'cocktail10.png', content_type: 'image/png')

puts "creating doses"
10.times do
  Dose.create!(description: Faker::Food.description, ingredient: Ingredient.all.sample, cocktail: Cocktail.all.sample)
end
puts "Created 10 cocktails!"
