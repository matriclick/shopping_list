class Measure < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :ingredients, :dependent => :destroy
  
  validates :name, :short_name, :presence => true
  
  attr_accessible :description, :name, :slug, :short_name
end
