class AddSlugToChefProfile < ActiveRecord::Migration
  def change
    add_column :chef_profiles, :slug, :string
    add_index :chef_profiles, :slug, unique: true
  end
end
