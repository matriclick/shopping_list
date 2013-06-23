class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :measure_id
      t.float :price
      t.float :quantity_for_price
      t.text :description

      t.timestamps
    end
  end
end
