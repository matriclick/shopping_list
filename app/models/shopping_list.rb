class ShoppingList < ActiveRecord::Base
  belongs_to :user
  
  has_and_belongs_to_many :recipes
  has_many :shopping_list_items
  
  attr_accessible :status_id, :user_id
  
  def number_of_items
    self.shopping_list_items.size
  end
end
