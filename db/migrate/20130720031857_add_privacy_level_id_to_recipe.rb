class AddPrivacyLevelIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :privacy_level_id, :integer
  end
end
