class ChangeNameAndTypeOfRecipeImage < ActiveRecord::Migration
  def up
    remove_column :recipe_images, :recipe_id_integer
    add_column :recipe_images, :recipe_id, :integer
  end

  def down
  end
end
