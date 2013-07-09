class CreateIngredientImages < ActiveRecord::Migration
  def change
    create_table :ingredient_images do |t|

      t.timestamps
    end
  end
end
