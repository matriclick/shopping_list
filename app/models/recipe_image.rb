class RecipeImage < ActiveRecord::Base
  belongs_to :ingredient

  has_attached_file :image, :styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
  
  attr_accessible :image
  
  def self.without_cover
		images = all
		images.slice!(0)
		images
	end	
	
end
