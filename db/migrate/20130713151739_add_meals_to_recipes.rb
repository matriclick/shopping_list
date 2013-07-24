class AddMealsToRecipes < ActiveRecord::Migration
  def change
    create_table :meals_recipes, :id => false do |t|
      t.integer :meal_id
      t.integer :recipe_id
    end
  end
end
