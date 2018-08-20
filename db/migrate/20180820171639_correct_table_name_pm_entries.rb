class CorrectTableNamePmEntries < ActiveRecord::Migration[5.2]
  def change
	  rename_table :pm_entrys, :pm_entries
  end
end
