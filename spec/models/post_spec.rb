require 'spec_helper'

describe Post do

  context "valid new root" do
    let(:user) { User.create() }
    let(:post) { Post.create(
                    user_id: user.id,
                    title: "First Title",
                    content: "Testing Content" )}

    it "should have a parent_id of nil" do
      post.parent_id.should be nil
    end

    it "should have a root_id of nil" do
      post.root_id.should be nil
    end
  end
end
