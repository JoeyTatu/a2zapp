class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :location_type
      t.string :address
      t.string :address2
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :reception_phone

      t.timestamps null: false
    end
  end
end
