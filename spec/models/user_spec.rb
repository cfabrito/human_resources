require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user)
  end

  subject { @user }

  describe "when created" do
    it { should be_valid }
  end
end
