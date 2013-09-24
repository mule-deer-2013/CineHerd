module VotesHelper
  def upvote_link(post)
    vote_link(post, true)
  end

  def downvote_link(post)
    vote_link(post, false)
  end

  def vote_link(post, value)
    arrow = value ? 'glyphicon-circle-arrow-down' : 'glyphicon-circle-arrow-up'
    name = "<i class='glyphicon #{arrow} vote-buttons'></i>"
    link_to raw(name), votes_path(:post_id => post.id, :value => value), :method => :post
  end
end
