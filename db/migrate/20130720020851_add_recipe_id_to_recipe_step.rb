class AddRecipeIdToRecipeStep < ActiveRecord::Migration
  def change
    add_column :recipe_steps, :recipe_id, :integer
  end
end
