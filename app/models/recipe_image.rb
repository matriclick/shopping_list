class RecipeImage < ActiveRecord::Base
  belongs_to :ingredient

  has_attached_file :image, :styles => { 
    :small => "180x180",
    :medium => "300x300>",
    :large => "500x500>", 
    :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
  
  attr_accessible :image
  
  def self.without_cover
		images = all
		images.slice!(0)
		images
	end	
	
end
