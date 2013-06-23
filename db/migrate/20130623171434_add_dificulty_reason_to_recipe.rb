class AddDificultyReasonToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :dificulty_reason, :text
  end
end
