class AddMeasureIdToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :measure_id, :integer
  end
end
