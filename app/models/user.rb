class User < ActiveRecord::Base
  after_create :create_user_preference
  
  has_one :chef_profile
  has_one :user_preference
  
  has_many :menus
  has_many :shopping_lists
  has_many :recipes
  
  has_and_belongs_to_many :tags
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :tag_ids, :name
  # attr_accessible :title, :body, :password_confirmation
  
  def get_chef_profile
    if !self.chef_profile.nil?
      return self.chef_profile 
    else
      self.chef_profile = ChefProfile.create(:user_id => self.id)
      self.save
      return self.chef_profile
    end 
  end
  
  def get_last_menu
    menu = self.menus.last
    if menu.nil?
      puts 'menu = Menu.create_for_user(self)'
      menu = Menu.create_for_user(self)
    end
    return menu
  end
  
  def get_current_shopping_list
    if self.shopping_lists.size > 0
      self.shopping_lists.last
    else
      return ShoppingList.create(:user_id => self.id)
    end
  end
  
  def is_admin
    return user.role_id == 1
  end
  
  def create_user_preference
    UserPreference.create(:user_id => self.id, :day_to_send_email => 6)
  end
  
  def get_next_start_date
    #Revisar si hay un menú actual
    #Si no lo hay, retornar la fecha más próxima al día que quiere que se le mande el mail
    #Si lo hay, ver cuando termina y desde ahí elegir la fecha más próxima
    return DateTime.now
  end
  
end
