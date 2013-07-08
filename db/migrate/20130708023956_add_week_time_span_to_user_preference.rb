class AddWeekTimeSpanToUserPreference < ActiveRecord::Migration
  def change
    add_column :user_preferences, :week_time_span, :integer
  end
end
