class AddProudColumnsToPmEntries < ActiveRecord::Migration[5.2]  
	def change
		  add_column :pm_entries, :proud1, :string
		  add_column :pm_entries, :proud2, :string
	end
end
