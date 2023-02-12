class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:customer_name]
         
  has_many :cat_coffee_shops, dependent: :destroy
  has_many :cat_coffee_shop_favorites, dependent: :destroy
  has_many :cat_coffee_shop_comments, dependent: :destroy
  
  has_many :lost_cats, dependent: :destroy
  has_many :lost_cat_favorites, dependent: :destroy
  has_many :lost_cat_comments, dependent: :destroy
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
         
  validates :customer_name, presence: true
  # validates :is_deleted, presence: true
  
  validates :status_message, length: {maximum:20}
  
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
  
  def self.search_for(content, method)
    if method == 'perfect'
      Customer.where(customer_name: content)
    elsif method == 'forward'
      Customer.where('customer_name LIKE ?', content + '%')
    elsif method == 'backward'
      Customer.where('customer_name LIKE ?', '%' + content)
    else
      Customer.where('customer_name LIKE ?', '%' + content + '%')
    end
  end
  
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  
  def following?(customer)
    followings.include?(customer)
  end
  
end
