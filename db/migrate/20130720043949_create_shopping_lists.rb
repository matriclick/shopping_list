class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.integer :status_id
      t.integer :user_id

      t.timestamps
    end
  end
end
