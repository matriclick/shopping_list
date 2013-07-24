class PrivacyLevel < ActiveRecord::Base
  has_many :recipes
  
  attr_accessible :description, :name
end
