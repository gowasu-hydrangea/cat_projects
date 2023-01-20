class CreateLostCatComments < ActiveRecord::Migration[6.1]
  def change
    create_table :lost_cat_comments do |t|
      
      t.integer :customer_id, null: false
      t.integer :lost_cat_id, null: false
      t.text :lost_cat_comment, null: false

      t.timestamps
    end
  end
end
