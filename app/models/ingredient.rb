class Ingredient < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
    
  has_many :recipes, :through => :recipe_ingredients
  has_many :recipe_ingredients
  
  has_and_belongs_to_many :user_preferences
  
  belongs_to :measure
  
  attr_accessible :description, :measure_id, :name, :price, :quantity_for_price, :slug
end
