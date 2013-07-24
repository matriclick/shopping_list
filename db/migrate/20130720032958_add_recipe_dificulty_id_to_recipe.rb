class AddRecipeDificultyIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_dificulty_id, :integer
  end
end
