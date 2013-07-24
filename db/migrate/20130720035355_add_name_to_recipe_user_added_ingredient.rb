class AddNameToRecipeUserAddedIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_user_added_ingredients, :name, :string
  end
end
