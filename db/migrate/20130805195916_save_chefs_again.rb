class SaveChefsAgain < ActiveRecord::Migration
  def up
    ChefProfile.find_each(&:save)
  end

  def down
  end
end
