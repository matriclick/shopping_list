class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :user_id
      t.integer :day_to_send_email

      t.timestamps
    end
  end
end
