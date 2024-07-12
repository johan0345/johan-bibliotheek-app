# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(email: 'johantonwork@gmail.com') do |user|
  user.username = 'johan admin'
  user.password = 'password'
  user.phone = '31612345678'
  user.role = 'admin'
  # Add more attributes as needed
end
