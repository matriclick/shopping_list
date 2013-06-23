class UserPreference < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ingredients
  
  attr_accessible :day_to_send_email, :user_id, :ingredient_ids
end
