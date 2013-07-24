class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @home = true
  end
  
  def user_home
    @recipes = Recipe.all
  end
  
  def administrator_home
  end
  
  def shopping_list
    @shopping_list = @user.shopping_lists.last
  end
  
end
