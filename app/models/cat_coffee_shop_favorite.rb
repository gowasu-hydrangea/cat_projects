class CatCoffeeShopFavorite < ApplicationRecord
    
    belongs_to :customer
    belongs_to :cat_coffee_shop
    
end
