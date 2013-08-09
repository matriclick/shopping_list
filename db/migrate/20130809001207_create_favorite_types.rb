class CreateFavoriteTypes < ActiveRecord::Migration
  def change
    create_table :favorite_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
