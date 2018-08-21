# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LocationsOrganization.destroy_all
Organization.destroy_all
Location.destroy_all
User.destroy_all

org = []
loc = []

100.times do 
  org << Organization.create(
    name: Faker::Company.name,
    email: Faker::Internet.email, 
    phone: Faker::PhoneNumber.cell_phone, 
    description: Faker::Lorem.sentence,
    bio: Faker::Lorem.paragraph(4),
    address: Faker::Address.full_address
  )
end

100.times do 
  loc << Location.create(
    long: Faker::Address.longitude.round(4),
    lat: Faker::Address.latitude.round(4),
    country: Faker::Address.country, 
    state: Faker::Address.state, 
    city: Faker::Address.city
  )
end

org.each_with_index do |org, index|
  LocationsOrganization.create(
    organization_id: org.id,
    location_id: loc[index].id
  )
end
