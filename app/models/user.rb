class User < ActiveRecord::Base
  before_create :create_user_preference
  
  has_many :menus
  has_one :user_preference
  has_and_belongs_to_many :tags
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :tag_ids
  # attr_accessible :title, :body
  
  def get_last_menu
    self.menus.last
  end
  
  def admin?
    return false
  end
  
  def create_user_preference
    UserPreference.create(:user_id => self.id, :day_to_send_email => 6)
  end
  
end
