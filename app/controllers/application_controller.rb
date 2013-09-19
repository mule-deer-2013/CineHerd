class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :comments_for_given_quest


  def comments_for_given_quest(x)
    @comments.select do |c|
      c.parent_id == x.id
    end
  end

end
