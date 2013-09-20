require 'spec_helper'

feature 'Posts' do
  context "#index" do
    before do
      @post = Post.create(
              user_id: 3,
              title: "Smelly",
              content: "anything")
      visit root_path
    end

    let(:content) { "Testing Content" }
    let(:title) { "First Title" }
    let(:user) { User.create() }
    let(:post) { Post.create(
                    user_id: user.id,
                    title: title,
                    content: content)}
    it "cant see a link to create a new post when user not signed in" do
        page.should_not have_content "Create new post"
    end

    it "can see all post titles" do
      page.should have_content("Smelly")
    end

    it "can redirect to post by clicking post title" do
      click_link("Smelly")
      page.current_path.should eq post_path(@post)
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
    let(:user) { User.create(
                  :username => "Alex",
                  :email => "christmaslatina@aol.com",
                  :password => "123notit"
                      ) }
    let(:post2) { Post.create(
                    user_id: user.id,
                    title: "nightime",
                    content: "it's late")}
    let(:answer) { Post.create(
      :user_id => user.id,
      :title => "This is an answer",
      :content => "This should be some content and whatnot",
      :parent_id => post2.id,
      :root_id => post2.id
    )}

    it "can see a post title" do
      visit post_path(post2)
      page.should have_content("nightime")

    end

    it "can see a post content" do
      visit post_path(post2)
      page.should have_content("it's late")
    end

    it "can see a post author" do
      visit post_path(post2)
      page.should have_content user.username
    end

    it "can see an answer" do
      visit post_path(post2)
      save_and_open_page
      page.should have_content answer.content
    end
  end

end
