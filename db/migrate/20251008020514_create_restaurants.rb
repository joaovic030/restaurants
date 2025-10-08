class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.text :name
      t.string :address

      t.timestamps
    end
  end
end
