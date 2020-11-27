# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

puts "Start creating ingredients database"
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

# puts "end of procedure !!"
# Cocktail.destroy_all
# puts "start seeding"
# 10.times do
#   file = URI.open("https://source.unsplash.com/#{rand(600..1000)}x#{rand(600..1000)}/?cocktail")
#   cocktail = Cocktail.new(name: Faker::Beer.name)
#   cocktail.photo.attach(io: file, filename: "#{cocktail.name}.png", content_type: 'image/png')
#   cocktail.save!
#   puts "...."
# end

# puts "ending seeding"
