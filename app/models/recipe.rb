class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :menus
  has_many :recipe_images, :dependent => :destroy
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :ingredients, :through => :recipe_ingredients

  accepts_nested_attributes_for :recipe_images, :allow_destroy => true	
	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |a| a[:quantity].blank? }, :allow_destroy => true

  validates :description, :name, :dificulty_reason, :dificulty, :cooking_time, :presence => true
  	    
  attr_accessible :description, :name, :tag_ids, :recipe_ingredients_attributes, :recipe_images_attributes, 
                  :dificulty_reason, :cooking_time, :dificulty, :slug
end
