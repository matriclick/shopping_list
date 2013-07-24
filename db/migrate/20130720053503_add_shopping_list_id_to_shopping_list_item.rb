class AddShoppingListIdToShoppingListItem < ActiveRecord::Migration
  def change
    add_column :shopping_list_items, :shopping_list_id, :integer
  end
end
