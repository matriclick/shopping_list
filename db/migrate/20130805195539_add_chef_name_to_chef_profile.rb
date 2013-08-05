class AddChefNameToChefProfile < ActiveRecord::Migration
  def change
    add_column :chef_profiles, :chef_name, :string
  end
end
