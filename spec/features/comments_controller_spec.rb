require 'spec_helper'

feature 'Comments' do
  context "making a new comment" do
    let(:comment) { build(:comment) }
    before(:each) { login(comment.user) }

    it "should have a link for a new comment" do
      visit post_path(comment.post)
      page.should have_content("Add a Comment")
    end

    it "should redirect to post_path if saved" do
      visit new_post_comment_path(comment.post)
      expect {
         fill_in 'comment_content', with: "Snow effect is amazing, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         click_button "Post Cinemagraph"
       }.to change(Comment, :count).by(1)
    end
  end
end
