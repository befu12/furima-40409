class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,       null: false, foreign_key: true
      t.text :explanation,      null: false
      t.string :item_name,      null: false
      t.integer :category_id,   null: false
      t.integer :price,         null: false
      t.integer :condition_id , null: false
      t.integer :burden_id,     null: false
      t.integer :prefecture_id, null: false
      t.integer :estimate_id ,  null: false
      t.timestamps
    end
  end
end
