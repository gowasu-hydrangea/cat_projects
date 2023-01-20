class CreateCatCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_coffee_shops do |t|
      
      # 会員ID
      t.integer :customer_id, null: false
      # 店名/最寄り駅
      t.string :cat_coffee_shop_location, null: false
      # タイトル
      t.string :cat_coffee_shop_title, null: false
      # 紹介文
      t.text :cat_coffee_shop_introduction, null: false
      # 投稿ステータス
      t.boolean :cat_coffee_shop_is_published_flag, null: false, default: false
      

      t.timestamps
    end
  end
end
