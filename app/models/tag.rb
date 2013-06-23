class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :recipes
  
  attr_accessible :description, :image_name, :name, :slug
end
