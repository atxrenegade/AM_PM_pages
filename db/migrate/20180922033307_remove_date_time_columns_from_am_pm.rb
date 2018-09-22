class RemoveDateTimeColumnsFromAmPm < ActiveRecord::Migration[5.2]
  def change
  	remove_column :am_entries, :time_date, :datetime
  	remove_column :pm_entries, :time_date, :datetime
  end
end
