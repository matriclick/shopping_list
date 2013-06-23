class AddNumberOfPersonsToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :number_of_persons, :integer
  end
end
