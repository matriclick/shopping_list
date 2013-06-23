class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :shopping_list

      t.timestamps
    end
  end
end
