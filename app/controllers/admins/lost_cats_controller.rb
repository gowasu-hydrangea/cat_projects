class Admins::LostCatsController < ApplicationController
  
  def index
    @lost_cats = LostCat.all
  end

  def show
    @lost_cat_comment = LostCatComment.new
  end

  def edit
  end

  def update
  end
  
end
