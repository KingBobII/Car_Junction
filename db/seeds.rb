# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'

puts "clearing db"
Car.destroy_all
User.destroy_all
Booking.destroy_all

puts "creating users"
john = User.create!(
  email: 'john@doe.com',
  first_name: 'John',
  last_name: 'Doe',
  password: '123456'
)

jane = User.create!(
  email: 'jane@smith.com',
  first_name: 'Jane',
  last_name: 'Smith',
  password: '123456'
)

puts "creating cars"
toyota = Car.new(name: 'Toyota Camry',
                year: 2022,
                review: 'Great car overall',
                registration_number: 123,
                mileage: '2000 miles',
                user: john)
toyota_url = "https://images.unsplash.com/photo-1624578571415-09e9b1991929?q=80&w=2790&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

toyota_file = URI.open(toyota_url)

#toyota.photo.attach




honda = Car.create!(name: 'Honda Civic', year: 2023, review: 'Good fuel efficiency', registration_number: 124, image: '/home/jessecesar/code/JesseCesar/Car_Junction/app/assets/images/Honda_civic.jpg',
  mileage: '1000 miles', user_id: User.second.id)

puts "creating bookings"
Booking.create(
  user: john,
  car: toyota,
  price_per_day: 50.0,
  start_date: Date.today,
  end_date: Date.today + 5.days
)

Booking.create(
  user: jane,
  car: honda,
  price_per_day: 40.0,
  start_date: Date.today + 2.days,
  end_date: Date.today + 7.days
)

Booking.create(
  user: john,
  car: honda,
  price_per_day: 45.0,
  start_date: Date.today + 1.day,
  end_date: Date.today + 6.days
)
