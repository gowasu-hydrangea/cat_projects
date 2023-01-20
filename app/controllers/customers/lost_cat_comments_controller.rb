class Customers::LostCatCommentsController < ApplicationController
    
  def create
    lost_cat = LostCat.find(params[:lost_cat_id])
    lost_cat_comment = current_user.lost_cat_comments.new(lost_cat_comment_params)
    lost_cat_comment.lost_cat_id = lost_cat.id
    lost_cat_comment.save
    redirect_to customers_lost_cat_path(lost_cat)
  end
  
  def destroy
    LostCatComment.find(params[:id]).destroy
    redirect_to customers_lost_cat_path(params[:lost_cat_id])
  end
  
  private
  
  def lost_cat_comment_params
    params.require(:lost_cat_comment).permit(:lost_cat_comment)
  end
    
end
