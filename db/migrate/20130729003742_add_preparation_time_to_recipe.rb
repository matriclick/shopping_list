class AddPreparationTimeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :preparation_time, :integer
  end
end
