class Meal < ActiveRecord::Base
  has_and_belongs_to_many :user_preferences
  has_and_belongs_to_many :recipes
  
  attr_accessible :description, :name
end
