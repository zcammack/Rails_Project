# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create!(
    email: 'zack@gmail.com',
    password: 'password'
)

u2 = User.create!(
    email: 'chase@gmail.com',
    password: 'password'
)

camp1 = Campaign.create!(
    
)

char1 = Character.create!(
    creator: u1
    first_name: 'Bragi',
    last_name: 'Bronzebeard'
)

char2 = Character.create!(
    creator: u2,
    first_name: 'Okri',
    last_name: 'Silverfist'
)