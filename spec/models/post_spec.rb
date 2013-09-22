require 'spec_helper'

describe Post do
  context "valid new root" do
    let(:content) { "Testing Content" }
    let(:title) { "First Title" }
    let(:user) { User.create }
    let(:post) { Post.create(
                    user_id: user.id,
                    title: title,
                    content: content,
                    extension: 'gif')}

    it "should have a parent_id of nil" do
      post.parent_id.should be_nil
    end

    it "should have a root_id of nil" do
      post.root_id.should be_nil
    end

    it "should have a title" do
      post.title.should be title
    end

    it "should have content" do
      post.content.should be content
    end
  end

 context "invalid new root" do
   it "should raise error if attributes missing" do
    post = Post.create()
    post.errors.size.should > 0
   end

   it "should not be saved if title is not unique" do
     post = Post.create(:user_id => 1, :title => "First Title", :content => "Bananas")
     expect { second_post = Post.create(:user_id => 2, :title => "First Title", :content => "Cookie")}.not_to change{Post.all.size}
   end
  end
end
