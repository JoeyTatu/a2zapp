class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_type
      t.string :first_name
      t.string :last_name
      t.date :started_on
      t.date :left_on
      t.string :address
      t.string :address2
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :personal_phone
      t.string :office_phone
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
