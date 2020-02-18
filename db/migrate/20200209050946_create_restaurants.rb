class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :address
      t.string :phone_number
      t.text :website

      t.timestamps
    end
  end
end
