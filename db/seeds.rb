# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(email: "le@email.com", password: "123456")
  Item.create!(user_id: 1, name: "bag", category: "Bags", size: "small", color: "blue", description: "blue pretty bag")
  Item.create!(user_id: 1, name: "shoes", category: "Shoes", size: "3", color: "black", description: "black pretty shoes")
  Item.create!(user_id: 1, name: "skirt", category: "Skirt", size: "large", color: "red", description: "red pretty skirt")
  Item.create!(user_id: 1, name: "bag", category: "Bags", size: "large", color: "brown", description: "brown pretty bag")
  Item.create!(user_id: 1, name: "bag", category: "Bags", size: "large", color: "yellow", description: "yellow pretty bag")
  Item.create!(user_id: 1, name: "blouse", category: "Blouse", size: "small", color: "yellow", description: "yellow pretty blouse")
  Item.create!(user_id: 1, name: "", category: "Trousers", size: "small", color: "blue", description: "blue pretty trousers")
puts "seeded"
