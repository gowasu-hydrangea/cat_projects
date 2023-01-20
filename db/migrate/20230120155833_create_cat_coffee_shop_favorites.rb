class CreateCatCoffeeShopFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_coffee_shop_favorites do |t|
      
      t.integer :customer_id, null: false
      t.integer :cat_coffee_shop_id, null: false

      t.timestamps
    end
  end
end
