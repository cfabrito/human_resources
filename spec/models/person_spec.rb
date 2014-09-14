require 'spec_helper'

describe Person do
  before do
    @person = FactoryGirl.build(:person)
  end

  subject { @person }

  describe "when created" do
    it { should be_valid }
  end

  # Attributes
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:birth_date) }
  it { should respond_to(:linkedin_url) }

  # Image
  it { should respond_to(:image) }

  # Simple validity tests
  describe "when first name not present" do
    before { @person.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name not present" do
    before { @person.last_name = " " }
    it { should_not be_valid }
  end

  describe "when phone number not present" do
    before { @person.phone_number = " " }
    it { should_not be_valid }
  end

  describe "when email not present" do
    before { @person.email = " " }
    it { should_not be_valid }
  end
  describe "when birth date not present" do
    before { @person.birth_date = " " }
    it { should_not be_valid }
  end
end
