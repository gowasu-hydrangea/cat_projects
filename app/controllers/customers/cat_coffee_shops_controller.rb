class Customers::CatCoffeeShopsController < ApplicationController
  
  # 投稿画面
  def new
    @cat_coffee_shop = CatCoffeeShop.new
  end

  # 投稿データの保存
  def create
    @cat_coffee_shop = CatCoffeeShop.new(cat_coffee_shop_params)
    @cat_coffee_shop.customer_id = current_customer.id
    @cat_coffee_shop.save
    redirect_to customers_cat_coffee_shops_path
  end

  # 一覧表示
  def index
    @cat_coffee_shops = CatCoffeeShop.all
    @cat_coffee_shop = CatCoffeeShop.new
    @customer = current_customer
  end

  def show
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
  end

  def edit
  end

  def update
  end

  # 投稿削除
  def destroy
    @cat_coffee_shop = CatCoffeeShop.find(params[:id])
    @cat_coffee_shop.destroy
    redirect_to customers_cat_coffee_shops_path
  end
  
  private
  
  def cat_coffee_shop_params
    params.require(:cat_coffee_shop).permit(:cat_coffee_shop_location, :cat_coffee_shop_title, :cat_coffee_shop_introduction, :image)
  end
  
end
