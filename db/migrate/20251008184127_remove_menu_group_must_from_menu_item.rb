class RemoveMenuGroupMustFromMenuItem < ActiveRecord::Migration[8.0]
  def change
    change_column_null :menu_items, :menu_group_id, true
  end
end
