require 'spec_helper'

feature 'Posts' do
  context "index" do
    it "has a link to create a new post" do
      visit '/'
      click_link("Create new post")
      page.current_path.should == new_post_path
    end
  end
end
