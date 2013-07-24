class CreateRecipeUserAddedIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_user_added_ingredients do |t|
      t.float :quantity
      t.integer :measure_id
      t.integer :user_added_ingredient_id

      t.timestamps
    end
  end
end
