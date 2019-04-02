class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :location, index: true, foreign_key: true
      t.string :department_name
      t.text :description
      t.string :department_phone

      t.timestamps null: false
    end
  end
end
