# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Car.destroy_all
User.destroy_all
User.create!(
  email: 'john@doe.com',
  first_name: 'John',
  last_name: 'Doe',
  password: '123456'
)

User.create!(
  email: 'jane@smith.com',
  first_name: 'Jane',
  last_name: 'Smith',
  password: '123456'
)

# Create cars associated with users
Car.create!(name: 'Toyota Camry', year: 2022, review: 'Great car overall', registration_number: 123, image: '/home/jessecesar/code/JesseCesar/Car_Junction/app/assets/images/Toyota Camry.jpeg',
  mileage: '2000 miles', user_id: User.first.id)
Car.create!(name: 'Honda Civic', year: 2023, review: 'Good fuel efficiency', registration_number: 124, image: '/home/jessecesar/code/JesseCesar/Car_Junction/app/assets/images/Honda_civic.jpg',
  mileage: '1000 miles', user_id: User.second.id)
