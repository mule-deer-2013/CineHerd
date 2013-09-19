require 'spec_helper'

feature 'Sign-up' do
  context "on users/new sign-up page" do
    before(:each) do
      visit new_user_path
    end

    it "should have a sign-up form" do
      page.should have_css("input[name='commit']")
    end
    context "with invalid info" do
      it "should raise error when password is absent" do
        fill_in 'username', with: "Lloyd"
        fill_in 'email', with: "lloyd@lloyd.com"
        expect{ click_on 'Create User' }.to raise_error
      end

      it "should raise error when username is absent" do
        fill_in 'email', with: "lloyd@lloyd.com"
        fill_in 'password', with: "lloyd"
        # expect(User.last.username).to eq("Lloyd")
        expect{ click_on 'Create User' }.to raise_error
      end
    end

    context "with valid info" do
      it "should create user when form is submitted" do
        fill_in 'username', with: "Lloyd"
        fill_in 'email', with: "lloyd@lloyd.com"
        fill_in 'password', with: "lloyd"
        # expect(User.last.username).to eq("Lloyd")
        expect{ click_on 'Create User' }.to change{User.count}.by(1)
      end
    end
  end
end
