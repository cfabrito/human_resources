# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # Empty team
  factory :team do
    name { Faker::Company.name }
    
    trait :with_people do
      ignore do
        people_count 0
      end
    
    after(:create) do |team, evaluator|
        team.people = create_list(:person, evaluator.people_count)
      end
    end
  end
end
