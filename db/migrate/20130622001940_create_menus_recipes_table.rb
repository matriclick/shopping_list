class CreateMenusRecipesTable < ActiveRecord::Migration
  def up    
    create_table :menus_recipes, :id => false do |t|
      t.integer :recipe_id
      t.integer :menu_id
    end
  end

  def down
  end
end
