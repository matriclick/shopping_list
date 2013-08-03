class IngredientCategory < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  
  attr_accessible :description, :name
end
