class RecipeUserAddedIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :measure
  
  attr_accessible :measure_id, :quantity, :recipe_id, :name
end
