class AddAttachmentImageToRecipeImages < ActiveRecord::Migration
  def self.up
    change_table :recipe_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :recipe_images, :image
  end
end
