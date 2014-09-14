# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create(email:'cfabrito@gmail.com', password:'123qwerty')

10.times do
  Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(9), email: Faker::Internet.email, birth_date: Faker::Date.birthday(min_age = 18, max_age = 65), linkedin_url: Faker::Internet.url('linkedin.com'), user_id: User.last.id)
end

5.times do
  Team.create(name: Faker::Company.name, user_id: User.last.id)
end

User.create(email:'rotero@faber-ventures.com', password:'12345678')

10.times do
  Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(9), email: Faker::Internet.email, birth_date: Faker::Date.birthday(min_age = 18, max_age = 65), linkedin_url: Faker::Internet.url('linkedin.com'), user_id: User.last.id)
end

5.times do
  Team.create(name: Faker::Company.name, user_id: User.last.id)
end

5.times do
  User.create(email:Faker::Internet.email, password:'12345678')

  10.times do
    Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(9), email: Faker::Internet.email, birth_date: Faker::Date.birthday(min_age = 18, max_age = 65), linkedin_url: Faker::Internet.url('linkedin.com'), user_id: User.last.id)
  end

  5.times do
    Team.create(name: Faker::Company.name, user_id: User.last.id)
  end
end
