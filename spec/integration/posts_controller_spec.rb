require 'spec_helper'

feature 'Posts' do
  context "#index" do
    it "can see a link to create a new post" do
      visit '/'
      click_link("Create new post")
      page.current_path.should == new_post_path
    end
  end

  context "#new" do
   it "can create a new post" do
       visit new_post_path
       expect {
         fill_in 'post_title',   with: "Delicious Cookies"
         fill_in 'post_content', with: "Are amazing, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         click_button "Create Post"
       }.to change(Post, :count).by(1)
       # page.should have_content "Post was successfully saved."

   end
  end
end
