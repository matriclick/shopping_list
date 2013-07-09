class Ingredient < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
    
  has_many :recipes, :through => :recipe_ingredients
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :ingredient_images, :dependent => :destroy
  has_and_belongs_to_many :user_preferences
  belongs_to :measure
  
  accepts_nested_attributes_for :ingredient_images, :allow_destroy => true
  
  validates :description, :measure_id, :name, :price, :quantity_for_price, :presence => true
  
  attr_accessible :description, :measure_id, :name, :price, :quantity_for_price, :slug, :ingredient_images_attributes
  
end
