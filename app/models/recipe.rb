class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :privacy_level
  belongs_to :recipe_dificulty
  belongs_to :user
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :menus
  has_and_belongs_to_many :meals
  has_and_belongs_to_many :shopping_lists

  has_many :recipe_images, :dependent => :destroy
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :recipe_steps, :dependent => :destroy
  has_many :ingredients, :through => :recipe_ingredients

  accepts_nested_attributes_for :recipe_images, :allow_destroy => true	
  accepts_nested_attributes_for :recipe_steps, :allow_destroy => true	
	accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |a| a[:quantity].blank? }, :allow_destroy => true

  validates :name, :dificulty_reason, :recipe_dificulty_id, :cooking_time, :privacy_level_id, :presence => true
  	    
  attr_accessible :description, :name, :tag_ids, :recipe_ingredients_attributes, :recipe_images_attributes, 
                  :dificulty_reason, :cooking_time, :dificulty, :slug, :meal_ids, :recipe_steps_attributes, :privacy_level_id,
                  :recipe_dificulty_id, :recipe_user_added_ingredients_attributes, :user_id, :people, :preparation_time, :introduction
                  
  def get_main_ingredients
    main_type = RecipeIngredientType.find_by_name("Principal")
    return self.recipe_ingredients.where(:recipe_ingredient_type_id => main_type.id)
  end
  
  def is_of_current_user(current_user)
    if !current_user.nil? and current_user.id == self.user_id
      return true
    else
      return false
    end
  end
    
  def add_to_shopping_list(shopping_list)
    shopping_list.recipes << self

    self.recipe_ingredients.each do |ri|
      exists = false
      shopping_list.shopping_list_items.each do |sli|
        if sli.ingredient == ri.ingredient
          exists = true
          if sli.measure == ri.measure
            sli.quantity = sli.quantity + ri.quantity
          else
            #TODO Por completar realizar conversión
            sli.quantity = sli.quantity + ri.quantity
          end
          sli.save
          break
        end
      end
      
      if !exists and !ri.ingredient.nil? and !ri.measure.nil?
        sli = ShoppingListItem.create(:ingredient_id => ri.ingredient.id, :quantity => ri.quantity, :measure_id => ri.measure.id)
        shopping_list.shopping_list_items << sli
        shopping_list.save
      end
    end
  end
	
	def remove_from_shopping_list(shopping_list)
	  shopping_list.recipes.delete(self)
	  self.recipe_ingredients.each do |ri|
      shopping_list.shopping_list_items.each do |sli|
        if sli.ingredient == ri.ingredient
          if sli.measure == ri.measure
            sli.quantity = sli.quantity - ri.quantity
          else
            #TODO Por completar realizar conversión
            sli.quantity = sli.quantity - ri.quantity
          end
          sli.save
          break
        end
      end
    end
  end
  
	def self.search(string_filter = nil, user_id = false, separator = ' ')
    if string_filter.nil? or string_filter == ''
      if only_from_logged_user and !current_user.nil?
        return current_user.recipes
      else
        return Recipe.all
      end
    else
      keywords = string_filter.split(separator)
      query = ''
      keywords.each_with_index do |k, i|
        if i == 0
          query = '(tags.name like "%'+k+'%" or meals.name like "%'+k+'%" or users.name like "%'+k+'%" or ingredients.name like "%'+k+'%" or recipes.name like "%'+k+'%")'
        else
          query = '(tags.name like "%'+k+'%" or meals.name like "%'+k+'%" or users.name like "%'+k+'%" or ingredients.name like "%'+k+'%" or recipes.name like "%'+k+'%") and '+query
        end
      end
      if user_id
        query = 'recipes.user_id = '+user_id.to_s+' AND '+query
      end 
      return self.joins(:ingredients).joins(:user).joins(:tags).joins(:meals).where(query).uniq
    end
  end
    
  def self.search_and(tag_names = Array.new, meal_names = Array.new, user_id = false)
    query = ''
    query_tags = ''
    query_meals = ''
    tag_names.each_with_index do |k, i|
      if i == 0
        query_tags = '(tags.name = "'+k+'")'
      else
        query_tags = '(tags.name = "'+k+'") or '+query_tags
      end
    end
    
    meal_names.each_with_index do |k, i|
      if i == 0
        query_meals = '(meals.name = "'+k+'")'
      else
        query_meals = '(meals.name = "'+k+'") or '+query_meals
      end
    end
    
    if tag_names.size > 0 and meal_names.size > 0
      query = '('+query_tags+') AND ('+query_meals+')'
    elsif tag_names.size > 0 and meal_names.size == 0
      query = '('+query_tags+')'
    else
      query = '('+query_meals+')'      
    end
    
    if user_id 
      query = '(recipes.user_id = '+user_id.to_s+') AND '+query
    end
    
    return self.joins(:tags).joins(:meals).joins(:user).where(query).uniq  
  end
    
end
