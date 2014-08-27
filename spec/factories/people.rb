# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "MyString"
    last_name "MyString"
    phone_number "MyString"
    email "MyString"
    birth_date "2014-08-27"
    linkedin_url "MyString"
  end
end
