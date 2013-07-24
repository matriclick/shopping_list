class IngredientCategory < ActiveRecord::Base
  has_many :ingredients
  
  attr_accessible :description, :name
end
