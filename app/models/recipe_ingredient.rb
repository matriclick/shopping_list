class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure
  belongs_to :recipe_ingredient_type
    
  attr_accessible :ingredient_id, :quantity, :recipe_id, :measure_id, :recipe_ingredient_type_id, :ingredient_name
    
  def ingredient_name
    ingredient.name if ingredient
  end

  def ingredient_name=(name)
    puts 'ingredient_name=(name) '+name
    self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end
  
end
