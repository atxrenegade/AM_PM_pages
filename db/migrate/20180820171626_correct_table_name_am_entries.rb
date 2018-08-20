class CorrectTableNameAmEntries < ActiveRecord::Migration[5.2]
  def change
	  rename_table :am_entrys, :am_entries 
  end
end
