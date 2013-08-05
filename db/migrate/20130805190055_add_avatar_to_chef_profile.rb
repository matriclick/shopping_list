class AddAvatarToChefProfile < ActiveRecord::Migration
  def self.up
    add_attachment :chef_profiles, :avatar
  end

  def self.down
    remove_attachment :chef_profiles, :avatar
  end
end
