# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

puts "Seeding users..."
u = User.create(email_address: "user@example.com", username: "xkyfal", password: "123456")
User.create(email_address: "test@example.com", username: "coolname1", password: "123456")

puts "\nSeeding exercises..."
Exercise.create(name: "T-Bar Row", description: "", user_id: u.id)
Exercise.create(name: "Kelso Shrug", description: "", user_id: u.id)
