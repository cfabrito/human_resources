# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :person do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    phone_number  { Faker::Number.number(9) }
    email         { Faker::Internet.email }
    birth_date    { Faker::Date.birthday(min_age = 18, max_age = 65) }
    linkedin_url  { Faker::Internet.url('linkedin.com') }
  end
end
