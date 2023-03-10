class CatCoffeeShop < ApplicationRecord
    
    has_one_attached :image
    
    belongs_to :customer
    
    validates :cat_coffee_shop_location, presence: true
    validates :cat_coffee_shop_title, presence: true
    validates :cat_coffee_shop_introduction, presence: true, length: {maximum:150}
    
    enum cat_coffee_shop_is_published_flag: { public: 0, private: 1 }, _prefix: true
    
    has_many :cat_coffee_shop_favorites, dependent: :destroy
    has_many :cat_coffee_shop_comments, dependent: :destroy
    
    def favorited_by?(customer)
        cat_coffee_shop_favorites.exists?(customer_id: customer.id)
    end
    
    def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no-image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
    end
    
    def self.search_for(content, method)
      if method == 'perfect'
        CatCoffeeShop.where(cat_coffee_shop_location: content)
      elsif method == 'forward'
        CatCoffeeShop.where('cat_coffee_shop_location LIKE ?', content+'%')
      elsif method == 'backward'
        CatCoffeeShop.where('cat_coffee_shop_location LIKE ?', '%'+content)
      else
        CatCoffeeShop.where('cat_coffee_shop_location LIKE ?', '%'+content+'%')
      end
    end
    
end
