class UserPreference < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :meals
    
  attr_accessible :day_to_send_email, :user_id, :ingredient_ids, :people, :week_time_span, :meal_ids, :people
end
