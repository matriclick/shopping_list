class RecipeStep < ActiveRecord::Base
  before_create :check_position
  belongs_to :recipe
  
  attr_accessible :description, :position, :recipe_id
  
  def check_position
    size = self.recipe.recipe_steps.size
    if size == 0
      self.position = 1
    else
      self.position = size + 1
    end
  end
  
end
