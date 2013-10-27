class PagesController < ApplicationController


  def new
  end

  def show
    render '/pages/about'
  end

end
