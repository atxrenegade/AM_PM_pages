class AddTimestampsToAmPmEntries < ActiveRecord::Migration[5.2]
	def change
       add_column :am_entries, :created_at, :datetime, null: false, default: Time.now
	   add_column :am_entries, :updated_at, :datetime, null: false, default: Time.now
       add_column :pm_entries, :created_at, :datetime, null: false, default: Time.now
	   add_column :pm_entries, :updated_at, :datetime, null: false, default: Time.now
    end
end
