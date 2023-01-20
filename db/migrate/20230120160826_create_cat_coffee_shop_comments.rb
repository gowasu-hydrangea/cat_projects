class CreateCatCoffeeShopComments < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_coffee_shop_comments do |t|
      
      t.integer :customer_id, null: false
      t.integer :cat_coffee_shop_id, null: false
      t.text :cat_coffee_shop_comment, null: false

      t.timestamps
    end
  end
end
