require 'spec_helper'

describe Team do
  before do
    @team = FactoryGirl.build(:team)
  end
  
  subject { @team }
  
  describe "when created" do
    it { should be_valid }
  end
  
  it { should respond_to(:name) }
  it { should respond_to(:people) }
  
  # Simple validity tests
  describe "when name not present" do
    before { @team.name = " " }
    it { should_not be_valid }
  end
end
