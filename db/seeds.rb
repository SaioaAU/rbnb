# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Dog.destroy_all
User.destroy_all
Rental.destroy_all


t.string "name"
    t.integer "age"
    t.string "race"
    t.text "bio"
    t.date "available_start_date"
    t.date "available_end_date"



puts 'Creating dogs...'
dogs_attributes = [
  {
    name: 'Old Fashioned'
    age: 'Old Fashioned'
    race: 'Old Fashioned'
    bio: 'Old Fashioned'
    available_start_date: 'Old Fashioned'
    available_end_date: 'Old Fashioned'
  },
  {
    name: 'Bloody Margaret'
  },
  {
    name: 'Long Island Iced Tea'
  },
  {
    name: 'Mr. Bali Hai'
  },
  {
    name: 'Flaming volcano'
  },
  {
    name: 'Jungle Bird'
  }
]
Dog.create!(dogs_attributes)

puts 'Creating users...'
users_attributes = [
  { name: 'Light rum' },
  { name: 'Applejack' },
  { name: 'Gin' },
  { name: 'Dark rum' },
  { name: 'Sweet Vermouth' },
  { name: 'Strawberry schnapps' },
  { name: 'Scotch' },
  { name: 'Southern Comfort' },
  { name: 'Brandy' }
]
Ingredient.create!(ingredients_attributes)
puts 'Creating doses...'
doses_attributes = [
  {
    description: '2 cl',
    cocktail_id: 1,
    ingredient_id: 1
  },
    {
    description: 'A handful',
    cocktail_id: 2,
    ingredient_id: 2
  },
    {
    description: '1 litre',
    cocktail_id: 3,
    ingredient_id: 3
  },
    {
    description: 'Some',
    cocktail_id: 4,
    ingredient_id: 4
  },
    {
    description: 'A pinch',
    cocktail_id: 5,
    ingredient_id: 5
  },
    {
    description: '1 cup',
    cocktail_id: 6,
    ingredient_id: 6
  }
]
Renta.create!(doses_attributes)
puts 'Finished!'
