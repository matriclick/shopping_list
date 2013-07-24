class AddIngredientCategoryIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :ingredient_category_id, :integer
  end
end
