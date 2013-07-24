class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :ingredient
  belongs_to :measure

  attr_accessible :ingredient_id, :measure_id, :quantity, :shopping_list_id
end
