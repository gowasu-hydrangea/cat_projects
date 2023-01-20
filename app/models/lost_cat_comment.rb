class LostCatComment < ApplicationRecord
    
    belongs_to :customer
    belongs_to :lost_cat
    
    validates :lost_cat_comment, presence: true
    
end
