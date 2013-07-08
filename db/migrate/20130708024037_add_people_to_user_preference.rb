class AddPeopleToUserPreference < ActiveRecord::Migration
  def change
    add_column :user_preferences, :people, :integer
  end
end
