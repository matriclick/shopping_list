class CreateRecipeIngredientTypes < ActiveRecord::Migration
  def change
    create_table :recipe_ingredient_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
