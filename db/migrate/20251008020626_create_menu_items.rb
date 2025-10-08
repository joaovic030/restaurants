class CreateMenuItems < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_items do |t|
      t.text :name
      t.text :description
      t.decimal :price
      t.decimal :cost
      t.references :menu, null: false, foreign_key: true
      t.references :menu_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
