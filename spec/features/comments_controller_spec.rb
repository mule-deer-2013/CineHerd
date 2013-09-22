require 'spec_helper'

feature 'Comments' do
  context "new" do
    let(:comment) { build(:comment) }
    before(:each) { login(comment.user) }

    it "should have a link" do
      visit post_path(comment.post)
      page.should have_content("Add a Comment")
    end

    it "should save to db if valid" do
      visit new_post_comment_path(comment.post)
      expect {
         fill_in 'comment_content', with: "Snow effect is amazing, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         click_button "Create Comment"
       }.to change(Comment, :count).by(1)
    end

    it "should redirect to post_path if saved" do
      visit new_post_comment_path(comment.post)
      fill_in 'comment_content', with: "something."
      click_button "Create Comment"
      page.current_path.should == post_path(comment.post)
    end

    it "should have comment content on post page" do
      visit new_post_comment_path(comment.post)
      fill_in 'comment_content', with: "I disagree"
      click_button "Create Comment"
      expect {
        post_path(comment.post)
      }.to have_content("I disagree")
    end
  end
end
