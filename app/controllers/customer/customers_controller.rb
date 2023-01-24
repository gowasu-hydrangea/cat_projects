class Customer::CustomersController < ApplicationController
  before_action :set_customer, only: [:cat_coffee_shop_favorites]
  
  def index
  end

  def show
    @customer = Customer.find(params[:id])
    # @cat_coffee_shops = CatCoffeeShop.all
    @cat_coffee_shops = @customer.cat_coffee_shops
    
    # @cat_coffee_shops = @customer.cat_coffee_shops
    # @lost_cats = @customer.lost_cats
    # @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to customer_customer_path(current_customer)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_customer_path(@customer.id)
  end
  
  # いいね一覧
  def cat_coffee_shop_favorites
    cat_coffee_shop_favorites = CatCoffeeShopFavorite.where(customer_id: @customer.id).pluck(:cat_coffee_shop_id)
     @favorite_cat_coffee_shops = CatCoffeeShop.find(cat_coffee_shop_favorites)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:customer_name, :status_message, :profile_image)
  end
  
  # いいね一覧
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
end
