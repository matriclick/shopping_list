class AddRecipeIngredientTypeIdToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :recipe_ingredient_type_id, :integer
  end
end
