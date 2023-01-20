class Admins::CatCoffeeShopsController < ApplicationController
  
  def index
    @cat_coffee_shops = CatCoffeeShop.all
  end

  def show
    @cat_coffee_shop_comment = CatCoffeeShopComment.new
  end

  def edit
  end

  def update
  end
  
end
