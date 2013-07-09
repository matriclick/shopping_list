class AddIngredientIdToIngredientImage < ActiveRecord::Migration
  def change
    add_column :ingredient_images, :ingredient_id, :integer
  end
end
