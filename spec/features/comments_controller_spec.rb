require 'spec_helper'

feature 'Comments' do
  context "making a new comment" do
    let(:content) { "Testing Content" }
    let(:title) { "First Title" }
    user = User.create(username: "hi", password: "123")
    let(:post) { Post.create(
                    user_id: user.id,
                    title: title,
                    content: content)}

    it "should have a link for a new comment" do
      visit post_path(post.id)
      page.should have_content("Add a Comment")
    end
  end
end
