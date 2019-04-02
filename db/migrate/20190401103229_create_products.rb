class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :website_id
      t.string :barcode
      t.string :product_name
      t.text :product_desc
      t.references :department, index: true, foreign_key: true
      t.string :size
      t.decimal :weight
      t.string :product_vendor
      t.integer :quanity_in_stock
      t.decimal :buy_price_each
      t.decimal :sell_price_each
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
