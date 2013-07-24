class AddRecipeIdToRecipeUserAddedIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_user_added_ingredients, :recipe_id, :integer
  end
end
