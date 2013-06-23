class ReSaveForFriendlyId < ActiveRecord::Migration
  def up
    Ingredient.find_each(&:save)
    Measure.find_each(&:save)
    Recipe.find_each(&:save)
    Tag.find_each(&:save)
  end

  def down
  end
end
