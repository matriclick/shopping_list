class ApplicationController < ActionController::Base
  before_filter :set_user_variable
  protect_from_forgery

  def after_sign_in_path_for(user)
    home_user_home_path
  end
    
  def set_user_variable
    @user = current_user
  end
  
end
