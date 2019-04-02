class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer, index: true, foreign_key: true
      t.string :card_type
      t.string :transaction_ref
      t.datetime :payment_date
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
