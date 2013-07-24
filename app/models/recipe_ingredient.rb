class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure
  belongs_to :recipe_ingredient_type
    
  attr_accessible :ingredient_id, :quantity, :recipe_id, :measure_id, :recipe_ingredient_type_id
end
