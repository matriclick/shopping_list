class CreateRecipeImages < ActiveRecord::Migration
  def change
    create_table :recipe_images do |t|
      t.string :recipe_id_integer

      t.timestamps
    end
  end
end
