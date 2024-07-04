# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# puts 'destroying db'
# db.destroy_all

# 10.times do
#   Restaurant.create(
#     name:
#   )
# end

puts "Cleaning database"
Restaurant.destroy_all
# Loop 5 times to create 5 restaurants
puts "Creating Restaurants restaurants."
5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
end

puts "Creating reviews"
Restaurant.all.each do |restaurant|
  rand(1..5).times do
    Review.create!(
      restaurant: restaurant,
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
  end
end
