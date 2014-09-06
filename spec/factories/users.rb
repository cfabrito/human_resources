# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    # Define a basic devise user.
    factory :user do
        id  1
        email "example@example.com"
        password "aaaaaaaa"
        password_confirmation "aaaaaaaa"
    end
end
