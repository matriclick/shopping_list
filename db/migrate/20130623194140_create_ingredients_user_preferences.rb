class CreateIngredientsUserPreferences < ActiveRecord::Migration
  def up
    create_table :ingredients_user_preferences, :id => false do |t|
      t.integer :user_id
      t.integer :ingredient_id
    end
  end

  def down
  end
end
