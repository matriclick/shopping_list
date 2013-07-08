class ApplicationController < ActionController::Base
  before_filter :set_user_variable
  protect_from_forgery

  def after_sign_in_path_for(user)
    if user.sign_in_count > 1
      home_user_home_path
    else
      tags_assign_to_user_path
    end
  end
    
  def set_user_variable
    @user = current_user
  end
  
end
