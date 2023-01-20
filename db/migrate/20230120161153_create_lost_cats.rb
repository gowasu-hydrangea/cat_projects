class CreateLostCats < ActiveRecord::Migration[6.1]
  def change
    create_table :lost_cats do |t|
      
      t.integer :customer_id, null: false
      t.string :lost_cat_title, null: false
      t.text :lost_cat_range, null: false
      t.text :lost_cat_introduction, null: false
      t.boolean :lost_cat_is_published_flag, null: false, default: false

      t.timestamps
    end
  end
end
