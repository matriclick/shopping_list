class Menu < ActiveRecord::Base
  before_save :create_shopping_list
  has_and_belongs_to_many :recipes
  belongs_to :user
  
  attr_accessible :end_date, :shopping_list, :start_date, :user, :recipe_ids, :user_id, :number_of_persons, :recipes
  
  def self.create_for_user(user)
    user_id = user.id
    start_date = user.get_next_start_date
    end_date = start_date + (user.user_preference.week_time_span*7).days
    menu = Menu.create(:start_date => start_date, :end_date => end_date, :user_id => user_id, :number_of_persons => user.user_preference.people)
    menu.assign_recipes_according_to_user
    menu.save
    return menu
  end
  
  def assign_recipes_according_to_user
    recipes_available = Array.new
    #self.user.tags.each do |tag|
    Tag.all.each do |tag|
      recipes_available.concat(tag.recipes)
    end
    recipes_available.shuffle #Desordeno el arreglo para que no todos los menús sean iguales
     
    number_of_days_in_menu = ((self.end_date - self.start_date) / 1.day).to_i
    puts 'number_of_days_in_menu '+number_of_days_in_menu.to_s
    
    number_recipes_available = recipes_available.size
    puts 'number_recipes_available '+number_recipes_available.to_s
    
    i = 0
    number_of_days_in_menu.times do
      if number_recipes_available > i
        self.recipes << recipes_available[i]
        i+= 1
      else
        i = 0
      end
    end
  end
  
  def create_shopping_list
    ingredients = Hash.new
    self.shopping_list = ''
    puts 'self.recipes.size '+self.recipes.size.to_s
    self.recipes.each do |recipe|
      puts 'recipe.recipe_ingredients.size '+recipe.recipe_ingredients.size.to_s
      recipe.recipe_ingredients.each do |recipe_ingredient|
        if ingredients.has_key?(recipe_ingredient.ingredient_id)
          ingredients[recipe_ingredient.ingredient_id] += recipe_ingredient.quantity
          puts 'ingredients[recipe_ingredient.ingredient_id] += recipe_ingredient.quantity'
        else
          ingredients[recipe_ingredient.ingredient_id] = recipe_ingredient.quantity
          puts 'ingredients[recipe_ingredient.ingredient_id] = recipe_ingredient.quantity'
        end
      end
    end    
    ingredients.each do |ingredient_id, quantity|
      ingredient = Ingredient.find(ingredient_id)
      if !ingredient.nil? and !ingredient.name.nil? and !ingredient.measure.nil? and !ingredient.measure.name.nil?
        self.shopping_list += ingredient.name+' - Cantidad '+quantity.to_s+' '+ingredient.measure.name+'\n' 
      end
    end
  end
  
end
