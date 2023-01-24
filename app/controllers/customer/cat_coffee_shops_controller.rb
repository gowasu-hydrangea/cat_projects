class Customer::CatCoffeeShopsController < ApplicationController
  
  def new
    @cat_coffee_shop = CatCoffeeShop.new
  end

  def create
    @cat_coffee_shop = CatCoffeeShop.new(cat_coffee_shop_params)
    @cat_coffee_shop.customer_id = current_customer.id
    @cat_coffee_shop.save
    redirect_to customer_cat_coffee_shops_path
  end

  def index
    @cat_coffee_shops = CatCoffeeShop.all
    @cat_coffee_shop = CatCoffeeShop.new
    @customer = current_customer
  end

  def show
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def edit
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def update
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
    if @cat_coffee_shop.update(cat_coffee_shop_params)
      redirect_to customer_cat_coffee_shop_path(@cat_coffee_shop.id)
      flash[:notice] = "変更が保存されました！内容をご確認ください"
    else
      render :edit
    end
  end

  def destroy
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
    @cat_coffee_shop.destroy
    redirect_to customer_cat_coffee_shops_path
  end
  
  private
  
  def cat_coffee_shop_params
    params.require(:cat_coffee_shop).permit(:cat_coffee_shop_location, :cat_coffee_shop_title, :cat_coffee_shop_introduction, :image)
  end
  
end
