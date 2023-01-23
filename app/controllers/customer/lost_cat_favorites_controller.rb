class Customer::LostCatFavoritesController < ApplicationController
    
  def create
    lost_cat = LostCat.find(params[:lost_cat_id])
    lost_cat_favorite = current_user.lost_cat_favorites.new(lost_cat_id: lost_cat.id)
    lost_cat_favorite.save
    redirect_to customers_lost_cat_path(lost_cat)
  end
  
  def destroy
    lost_cat = LostCat.find(params[:lost_cat_id])
    lost_cat_favorite = current_user.lost_cat_favorites.find_by(lost_cat_id: lost_cat.id)
    lost_cat_favorite.destroy
    redirect_to customers_lost_cats_path(lost_cat)
  end
    
end
