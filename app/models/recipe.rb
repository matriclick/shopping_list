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
      
      if !exists
        sli = ShoppingListItem.new
        sli.ingredient = ri.ingredient
        sli.quantity = ri.quantity
        sli.measure = ri.measure
        sli.save
        shopping_list.shopping_list_items << sli
        shopping_list.save
      end
    end
  end
	
	def self.search(string_filter = nil, separator = ' ')
    if string_filter.nil?
      return Recipe.all
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
      return self.joins(:ingredients).joins(:user).joins(:tags).joins(:meals).where(query).uniq
    end
  end
    
  def self.search_and(tag_names, meal_names, ingredient_names)
    query = ''
    tag_names.each_with_index do |k, i|
      if i == 0
        query = '(tags.name = "'+k+'")'
      else
        query = '(tags.name = "'+k+'") or '+query
      end
    end
    
    meal_names.each_with_index do |k, i|
      if i == 0 and tag_names.size == 0
        query = '(meals.name = "'+k+'")'
      else
        query = '(meals.name = "'+k+'") or '+query
      end
    end
    ingredient_names.each_with_index do |k, i|
      if i == 0 and tag_names.size == 0 and meal_names.size == 0
        query = '(ingredients.name = "'+k+'")'
      else
        query = '(ingredients.name = "'+k+'") or '+query
      end
    end
    return self.joins(:ingredients).joins(:tags).joins(:meals).where(query).uniq  
  end
    
  def recipe_images_without_first
  end
  
end
