class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
  end
  
  def user_home
    @user = current_user
    @menu = @user.get_last_menu
  end
  
  def administrator_home
    @user = current_user
  end
  
end
