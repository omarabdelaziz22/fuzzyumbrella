# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all


20.times do |n|
    category_name = Faker::Commerce.unique.department
    Category.create!(name: category_name)
  end
100.times do |n|
    product_name = Faker::Commerce.unique.product_name
    price = Faker::Commerce.price
    category_id = rand(Category.count) +1
    Product.create!(name: product_name, price: price, category_id: category_id)
  end
