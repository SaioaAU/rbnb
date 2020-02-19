# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts 'Cleaning database...'
Dog.destroy_all
User.destroy_all
Rental.destroy_all

puts 'Creating users...'

50.times do
  users_attributes =
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password"
    }
  User.create!(users_attributes)
end



puts 'Creating dogs...'


50.times do
  today = Date.today + rand(0..50)
  dogs_attributes =
    {
      name: Faker::Creature::Dog.unique.name,
      age: Faker::Creature::Dog.age,
      race: Faker::Creature::Dog.breed,
      bio: 'Like to walk in the woods and pee on trees. Woff!',
      available_start_date: today,
      available_end_date: today + rand(0..50),
      owner: User.all.sample
    }
  Dog.create!(dogs_attributes)
end

puts 'Creating rentals...'

50.times do
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
