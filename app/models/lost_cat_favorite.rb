class LostCatFavorite < ApplicationRecord
    
    belongs_to :customer
    belongs_to :lost_cat
    
end
