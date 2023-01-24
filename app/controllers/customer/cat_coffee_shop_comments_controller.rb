class Customer::CatCoffeeShopCommentsController < ApplicationController
    
  def create
    cat_coffee_shop = CatCoffeeShop.find(params[:cat_coffee_shop_id])
    cat_coffee_shop_comment = current_customer.cat_coffee_shop_comments.new(cat_coffee_shop_comment_params)
    cat_coffee_shop_comment.cat_coffee_shop_id = cat_coffee_shop.id
    cat_coffee_shop_comment.save
    # redirect_to customer_cat_coffee_shop_path(cat_coffee_shop)
  end
  
  def destroy
    CatCoffeeShopComment.find(params[:id]).destroy
    # redirect_to customer_cat_coffee_shop_path(params[:cat_coffee_shop_id])
  end
  
  private
  
  def cat_coffee_shop_comment_params
    params.require(:cat_coffee_shop_comment).permit(:cat_coffee_shop_comment)
  end
    
end
