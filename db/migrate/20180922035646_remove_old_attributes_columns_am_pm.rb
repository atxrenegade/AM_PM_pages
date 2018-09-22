class RemoveOldAttributesColumnsAmPm < ActiveRecord::Migration[5.2]
  def change
  	remove_column :am_entries, :goals, :string
	remove_column :am_entries, :gratitude, :string
  	remove_column :pm_entries, :excellent, :string
	remove_column :pm_entries, :lessons, :string
	remove_column :pm_entries, :gratitude, :string
  end
end
