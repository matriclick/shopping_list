class CreateRecipesShoppingLists < ActiveRecord::Migration
  def up
    create_table :recipes_shopping_lists, :id => false do |t|
      t.integer :recipe_id
      t.integer :shopping_list_id
    end
  end

  def down
  end
end
