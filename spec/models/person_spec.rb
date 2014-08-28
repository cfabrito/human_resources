require 'spec_helper'

describe Person do
  it "has a valid factory" do
    FactoryGirl.create(:person).should be_valid
  end
  it "is invalid without a firstname" do
    FactoryGirl.build(:person, first_name: nil).should_not be_valid
  end
  it "is invalid without a lastname" do
    FactoryGirl.build(:person, last_name: nil).should_not be_valid
  end
  it "is invalid without a phone number" do
    FactoryGirl.build(:person, phone_number: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:person, email: nil).should_not be_valid
  end
  it "is invalid without a birthdate" do
    FactoryGirl.build(:person, birth_date: nil).should_not be_valid
  end
  it "returns a person's full name as a string" do
    person = FactoryGirl.build(:person, first_name: "John", last_name: "Doe")
    person.name.should == "John Doe"
  end
end
