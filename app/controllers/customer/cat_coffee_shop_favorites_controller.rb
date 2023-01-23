class Customer::CatCoffeeShopFavoritesController < ApplicationController
    
  def create
    cat_coffee_shop = CatCoffeeShop.find(params[:cat_coffee_shop_id])
    cat_coffee_shop_favorite = current_user.cat_coffee_shop_favorites.new(cat_coffee_shop_id: cat_coffee_shop.id)
    cat_coffee_shop_favorite.save
    redirect_to customers_cat_coffee_shop_path(cat_coffee_shop)
    # @cat_coffee_shop_favorite = CatCoffeeShopFavorite.new(customer_id: current_user.id, cat_coffee_shop_id: params[:cat_coffee_shop_id])
    # @cat_coffee_shop_favorite.save
    # redirect_to customers_cat_coffee_shop_path(params[:cat_coffee_shop_id])
  end
  
  def destroy
    cat_coffee_shop = CatCoffeeShop.find(params[:cat_coffee_shop_id])
    cat_coffee_shop_favorite = current_user.cat_coffee_shop_favorites.find_by(cat_coffee_shop_id: cat_coffee_shop.id)
    cat_coffee_shop_favorite.destroy
    redirect_to customers_cat_coffee_shops_path(cat_coffee_shop)
    # @cat_coffee_shop_favorite = CatCoffeeShopFavorite.find_by(customer_id: current_user.id, cat_coffee_shop_id: params[:cat_coffee_shop_id])
    # @cat_coffee_shop_favorite.destroy
    # redirect_to customers_cat_coffee_shop_path(params[:cat_coffee_shop_id])
  end
  
end
