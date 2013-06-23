class Measure < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :ingredients
  
  attr_accessible :description, :name, :slug
end
