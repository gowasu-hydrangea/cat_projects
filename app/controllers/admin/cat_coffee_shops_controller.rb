class Admin::CatCoffeeShopsController < ApplicationController
  
  def index
    @cat_coffee_shops = CatCoffeeShop.all
  end

  def show
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def edit
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def update
  end
  
end
