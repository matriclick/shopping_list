class AddFriendlyUrls < ActiveRecord::Migration
  def up
    add_column :ingredients, :slug, :string
    add_index :ingredients, :slug, unique: true
    
    add_column :measures, :slug, :string
    add_index :measures, :slug, unique: true
    
    add_column :recipes, :slug, :string
    add_index :recipes, :slug, unique: true
    
    add_column :tags, :slug, :string
    add_index :tags, :slug, unique: true
  end

  def down
  end
end
