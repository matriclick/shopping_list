class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.integer :ingredient_id
      t.integer :measure_id
      t.float :quantity

      t.timestamps
    end
  end
end
