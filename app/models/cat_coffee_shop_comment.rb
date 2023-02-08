class CatCoffeeShopComment < ApplicationRecord
    
    belongs_to :customer
    belongs_to :cat_coffee_shop
    
    validates :cat_coffee_shop_comment, presence: true, length: {maximum:100}
    
end
