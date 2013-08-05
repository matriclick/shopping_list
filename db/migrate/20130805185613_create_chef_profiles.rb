class CreateChefProfiles < ActiveRecord::Migration
  def change
    create_table :chef_profiles do |t|
      t.text :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
