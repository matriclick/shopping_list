class ChefProfile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :chef_name, use: :slugged
  
  belongs_to :user
  
  has_attached_file :avatar, :styles => { 
    :medium => "300x300>", 
    :large => "500x500>",
    :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
  
  attr_accessible :introduction, :user_id, :avatar, :chef_name
end
