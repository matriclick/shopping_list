class CreatePrivacyLevels < ActiveRecord::Migration
  def change
    create_table :privacy_levels do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
