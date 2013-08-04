class AddIntroductionToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :introduction, :text
  end
end
