class HasAttachedFileIngredientImage < ActiveRecord::Migration
  def self.up
    add_attachment :ingredient_images, :image
  end

  def self.down
    remove_attachment :ingredient_images, :image
  end
end
