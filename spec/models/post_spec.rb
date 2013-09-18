require 'spec_helper'

describe Post do
  context "new root" do
    let(:user) { User.create() }
    let(:post) { Post.create(
                    user: user.id,
                    title: "First Title",
                    content: "Testing Content" )}

    it "should have a parent_id of nil" do
    end

    it "should have a root_id of nil" do
    end
  end
end
