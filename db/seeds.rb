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
                 description: 'Reliable midsize sedan with a perfect blend of comfort, efficiency, and advanced technology for a smooth everyday drive.',
                 registration_number: 123,
                 mileage: '2000 miles',
                 user: john,
                 price_per_day: "555 ZAR")
toyota_url = "https://images.unsplash.com/photo-1624578571415-09e9b1991929?q=80&w=2790&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

toyota_file = URI.open(toyota_url)

toyota.image.attach(io: toyota_file, filename: 'toyota.png', content_type: 'image/png')
toyota.save

lamborghini = Car.new(name: 'Lamborghini Urus',
                      year: 2022,
                      description: 'Striking luxury SUV, blending Italian craftsmanship with high performance, delivering an exhilarating driving experience in a distinctive, bold package.',
                      registration_number: 123,
                      mileage: '20 km',
                      user: john,
                      price_per_day: "80 000 ZAR")
lamborghini_url = "https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20221019114208_Urus_Performante_Giallo_Inti_Track_HIGH_Z9A2323.jpg&w=726&h=482&q=75&c=1"

lamborghini_file = URI.open(lamborghini_url)

lamborghini.image.attach(io: lamborghini_file, filename: 'lamborghini.png', content_type: 'image/png')
lamborghini.save

ferrari = Car.new(name: 'Ferrari Pista',
                  year: 2022,
                  description: 'Track-focused marvel, the Pista showcases Ferraris racing pedigree, featuring a potent V8 engine and aerodynamic innovations for thrilling performance on any road.',
                  registration_number: 123,
                  mileage: '20 km',
                  user: john,
                  price_per_day: "96 000 ZAR")
ferrari_url = "https://themastercylinderblog.files.wordpress.com/2021/08/dsc_0039-1.jpg"

ferrari_file = URI.open(ferrari_url)

ferrari.image.attach(io: ferrari_file, filename: 'ferrari.png', content_type: 'image/png')
ferrari.save

koenigsegg = Car.new(name: 'Koenigsegg Agera RS',
                     year: 2022,
                     description: 'Swedish hypercar engineering masterpiece, the Agera RS boasts mind-boggling speed, advanced technology, and exquisite craftsmanship for ultimate automotive excellence.',
                     registration_number: 123,
                     mileage: '50 km',
                     user: john,
                     price_per_day: "136 500 ZAR")
koenigsegg_url = "https://e1.pxfuel.com/desktop-wallpaper/643/17/desktop-wallpaper-best-5-koenigsegg-on-hip-koenigsegg-agera-rs.jpg"

koenigsegg_file = URI.open(koenigsegg_url)

koenigsegg.image.attach(io: koenigsegg_file, filename: 'koenigsegg.png', content_type: 'image/png')
koenigsegg.save

svj = Car.new(name: 'svj',
              year: 2022,
              description: 'Cutting-edge hypercar, the SVJ combines extraordinary design, powerful V12 engine, and advanced aerodynamics for an unparalleled driving adventure.',
              registration_number: 123,
              mileage: '50 km',
              user: john,
              price_per_day: "109 000 ZAR")
svj_url = "https://www.alainclass.com/wp-content/uploads/2019/04/1170.jpg"

svj_file = URI.open(svj_url)

svj.image.attach(io: svj_file, filename: 'svj.png', content_type: 'image/png')
svj.save

puts "creating bookings"
Booking.create(
  user: john,
  car: toyota,
  price_per_day: 500.0,
  start_date: Date.today,
  end_date: Date.today + 5.days
)

Booking.create(
  user: john,
  car: ferrari,
  price_per_day: 96000.0,
  start_date: Date.today + 2.days,
  end_date: Date.today + 7.days
)

Booking.create(
  user: john,
  car: lamborghini,
  price_per_day: 109000.0,
  start_date: Date.today + 1.day,
  end_date: Date.today + 6.days
)
