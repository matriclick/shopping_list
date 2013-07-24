class CreateRecipeDificulties < ActiveRecord::Migration
  def change
    create_table :recipe_dificulties do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
