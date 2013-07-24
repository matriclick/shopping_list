class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.integer :position
      t.text :description

      t.timestamps
    end
  end
end
