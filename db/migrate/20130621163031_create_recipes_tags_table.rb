class CreateRecipesTagsTable < ActiveRecord::Migration
  def up
    create_table :recipes_tags, :id => false do |t|
      t.integer :recipe_id
      t.integer :tag_id
          
      t.timestamps
    end
    
  end

  def down
  end
end
