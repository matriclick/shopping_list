class UpdateUserPreferenceIdColumn < ActiveRecord::Migration
  def up
    if column_exists? :ingredients_user_preferences, :user_id
      rename_column :ingredients_user_preferences, :user_id, :user_preference_id
    end
    if column_exists? :user_preferences, :user_preference_id
      rename_column :user_preferences, :user_preference_id, :user_id
    end
  end

  def down
  end
end
