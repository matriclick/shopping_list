class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :favorite_type_id

      t.timestamps
    end
  end
end
