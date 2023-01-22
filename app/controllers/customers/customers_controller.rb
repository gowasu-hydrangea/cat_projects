class Customers::CustomersController < ApplicationController
  
  def index
  end

  def show
    @customer = Customer.find(params[:id])
    # @cat_coffee_shops = @customer.cat_coffee_shops
    # @lost_cats = @customer.lost_cats
  end

  def edit
  end

  def update
  end
  
end
