class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :last_active
      t.string :address
      t.string :address2
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :phone
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
