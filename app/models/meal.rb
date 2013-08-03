class Meal < ActiveRecord::Base
  has_and_belongs_to_many :user_preferences
  has_and_belongs_to_many :recipes, :dependent => :destroy
  
  attr_accessible :description, :name
  
  def get_four_recipes
    self.recipes.limit 4
  end
end
