require 'open-uri'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ing_list = open(url).read

ingredients_json = JSON.parse(ing_list)

ingredients_arr = ingredients_json["drinks"]

cocktails = [ "Old Fashioned", "Martinez", "Martini", "Manhattan", "Brooklyn", "Daiquiri", "Margarita", "Sidecar", "French 75", "Bloody Mary", "Irish Coffee", "Jack Rose", "Negroni"]

8.times do
  ingredient = Ingredient.new(name: ingredients_arr[rand(0..159)]["strIngredient1"])
  ingredient.save

  cocktail = Cocktail.new(name: "The #{Faker::Hacker.adjective} #{cocktails[rand(0..12)]}")
  cocktail.save

  review = Review.new(rating: rand(0..5), content: Faker::Hipster.sentence(3), cocktail_id: cocktail.id)
  review.save

  dose = Dose.new(description: "#{rand(1..5)}cl", cocktail_id: cocktail.id, ingredient_id: ingredient.id)
  dose.save
end
