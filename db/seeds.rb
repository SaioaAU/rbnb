# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'
puts 'Cleaning database...'
Rental.destroy_all
Dog.destroy_all
User.destroy_all

puts 'Creating users...'

30.times do
  users_attributes =
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password"
    }
  User.create!(users_attributes)
end

puts 'Creating dogs...'


30.times do
  today = Date.today + rand(0..50)
  streets = [" Schweigaards gate, Sandnes","South Circular Road, Dublin", "North Circular Road, Dublin", " Gran Via, Bilbao", " Lapurdi, Galdakao", " Sognsveien, Oslo", " Karl johans Gate, Gothenburg", " Skjelderups gate, Oslo", " Akersgate, Oslo"]
  dogname = Faker::Creature::Dog.unique.name
  puts "we are going to create a dog #{dogname}"
  address = JSON.load(URI.open("https://dog.ceo/api/breeds/image/random"))["message"]
  breed = address.split("/")[-2]
  dog = Dog.new({
    name: dogname,
    age: Faker::Creature::Dog.age,
    race: breed,
    bio: 'Like to walk in the woods and pee on trees. Woff!',
    available_start_date: today,
    available_end_date: today + rand(0..50),
    owner: User.all.sample,
    address: rand(1..30).to_s + streets.sample,
  })
  file = URI.open(URI.escape(address))
  if file.class == Tempfile
    dog.photos.attach(io: file, filename: "#{dogname}.jpg", content_type: 'image/jpg')
    dog.save!
  end
end

puts 'Creating rentals...'

30.times do |i|
  puts "creating rental n #{i}..."
  today = Date.today + rand(0..50)
  rentals_attributes =
    {
      rented_start_date: today,
      rented_nd_date: today + rand(0..50),
      user: User.all.sample,
      dog: Dog.all.sample
    }
  Rental.create!(rentals_attributes)
end
puts 'Finished!'
