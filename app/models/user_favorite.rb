class UserFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  belongs_to :favorite_type
  
  attr_accessible :favorite_type_id, :recipe_id, :user_id
end
