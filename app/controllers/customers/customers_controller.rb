class Customers::CustomersController < ApplicationController
  
  def index
  end

  def show
    @customer = Customer.find(params[:id])
    # @cat_coffee_shops = @customer.cat_coffee_shops
    # @lost_cats = @customer.lost_cats
    # @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def edit
  end

  def update
  end
  
end
