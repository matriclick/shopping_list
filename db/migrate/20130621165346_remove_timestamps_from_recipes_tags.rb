class RemoveTimestampsFromRecipesTags < ActiveRecord::Migration
  def up
    remove_column :recipes_tags, :created_at
    remove_column :recipes_tags, :updated_at
  end

  def down
    add_column :recipes_tags, :updated_at, :string
    add_column :recipes_tags, :created_at, :string
  end
end
