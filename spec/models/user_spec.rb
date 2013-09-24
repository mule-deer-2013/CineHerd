require 'spec_helper'

describe User do
  it { should have_many :comments }
  it { should have_many :posts }
  it { should have_many :votes }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  let(:user) { build(:user) }

  context "create new" do
    it "can be created" do
      # this is a bad test, you're testing ruby
      expect(user).to be_an_instance_of User
    end

    it "should be able to choose a new password" do
      user.password = 'cat'
      user.save
      expect(user.authenticate('cat')).to eq(user)
    end
  end
end
