require 'spec_helper'

feature 'Sign-in' do
  let(:user) { build(:user) }

  context "through navbar login form" do
    before(:each) { visit root_path }

    it "should display a navbar" do
      page.should have_css(".navbar")
    end

    context "with invalid password", :js => true do
      it "should not log in the user" do
        fill_in 'username', with: user.username
        fill_in 'password', with: "dinosaur"
        click_on 'sign_in'
        expect(page).to have_css('#sign_in')
      end
    end

    context "with valid info", :js => true do
      let(:user) { User.create(username: 'bob', password: 'bob', email: 'bob')}
      it "should log in the user" do
        fill_in 'username', with: user.username
        fill_in 'password', with: user.password
        click_on 'sign_in'
        expect(page).to have_css('#signout')
      end
    end
  end
end
