class AddDificutlyToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :dificulty, :integer
  end
end
