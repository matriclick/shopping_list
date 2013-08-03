class AddShortNameToMeasure < ActiveRecord::Migration
  def change
    add_column :measures, :short_name, :string
  end
end
