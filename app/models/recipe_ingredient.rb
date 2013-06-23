class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  
  attr_accessible :ingredient_id, :quantity, :recipe_id
end
