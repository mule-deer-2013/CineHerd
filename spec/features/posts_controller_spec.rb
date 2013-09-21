require 'spec_helper'

feature 'Posts' do
  context "#index" do
    let(:content) { "Testing Content" }
    let(:title) { "First Title" }
    let(:user) { User.create() }
    let(:post) { Post.create(
                    user_id: user.id,
                    title: title,
                    content: content,
                    extension: 'gif')}
    it "can see a link to create a new post" do
      visit '/'
      click_link("Create new post")
      page.current_path.should == new_post_path
    end

    it "can see all post titles" do
      post = Post.create(
                    user_id: 3,
                    title: "Smelly",
                    content: "anything",
                    extension: 'gif')
      visit '/'
      page.should have_content("Smelly")
    end

    it "can redirect to post by clicking post title" do
        post1 = Post.create(
                    user_id: 3,
                    title: "Groovy",
                    content: "else",
                    extension: 'gif')
      visit '/'
      click_link("Groovy")
      page.current_path.should == post_path(post1.id)
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

  context "#show" do
    let(:post2) { Post.create(
                    user_id: 8,
                    title: "nightime",
                    content: "it's late",
                    extension: 'gif')}
    it "can see a post title" do
      visit post_path(post2.id)
      page.should have_content("nightime")

    end

    it "can see a post content" do
      visit post_path(post2.id)
      page.should have_content("it's late")
    end

    it "can see a post author" do
      pending
    end
  end

end
