require 'spec_helper'

feature 'Posts', js: true do
  let(:post) { create(:post) }

  context "#index" do
    before(:each) { login post.user }

    # you are repeating yourself.
    it "can see a link to create a new post" do
      visit root_path
      page.should have_content("Create new post")
    end

    it "has a link to create a new post" do
      visit root_path
      click_link("Create new post")
      expect(page.current_path).to eq new_post_path
    end

    it "can see all post titles" do
      visit root_path
      # use expect syntax
      page.should have_content(post.title)
    end

    it "can redirect to post by clicking post title" do
      visit root_path
      click_link(post.title)
      page.current_path.should eq post_path(post.id)
    end
  end

  context "#new" do
    before(:each) do
      login(post.user)
    end

   it "can create a new post" do
       visit new_post_path
       # you have to stub file upload
       expect {
         fill_in 'post_title',   with: "Delicious Cookies"
         fill_in 'post_content', with: "Are amazing, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         attach_file('file_uploader', 'public/favicon.ico')
         click_button "Post Cinemagraph"
         # This test fails, not sure why. Gave it everything I had.
       }.to change { Post.count }.by(1)
   end
  end

  context "#show" do
    it "displays the post's title" do
      visit post_path(post.id)
      page.should have_content(post.title)
    end

    it "displays the post's content" do
      visit post_path(post.id)
      page.should have_content(post.content)
    end
  end

end
