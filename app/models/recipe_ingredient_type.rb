class RecipeIngredientType < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients
  
  attr_accessible :name
end
