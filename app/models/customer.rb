class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cat_coffee_shops, dependent: :destroy
  has_many :cat_coffee_shop_favorites, dependent: :destroy
  has_many :cat_coffee_shop_comments, dependent: :destroy
  
  has_many :lost_cats, dependent: :destroy
  has_many :lost_cat_favorites, dependent: :destroy
  has_many :lost_cat_comments, dependent: :destroy
         
  validates :customer_name, presence: true
  # validates :is_deleted, presence: true
  
  has_one_attached :profile_image
  # has_one_attached :image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no-image.jpg'
  end
  
  def self.guest
  find_or_create_by!(email: 'aaa@aaa.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.password_confirmation = customer.password
    customer.customer_name = 'サンプル'
    # customer.status_message = 'hi'
  end
  end
  
  # def get_image
  #     unless image.attached?
  #       file_path = Rails.root.join('app/assets/images/no-image.jpg')
  #       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #     end
  #       image
  # end
  
end
