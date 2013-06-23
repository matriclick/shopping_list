class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
