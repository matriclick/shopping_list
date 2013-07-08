class CreateMealsUserPreferences < ActiveRecord::Migration
  def up
    create_table :meals_user_preferences, :id => false do |t|
      t.integer :meal_id
      t.integer :user_preference_id
    end
  end

  def down
  end
end
