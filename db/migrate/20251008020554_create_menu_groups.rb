class CreateMenuGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_groups do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
