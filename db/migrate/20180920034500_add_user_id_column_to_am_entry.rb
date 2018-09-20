class AddUserIdColumnToAmEntry < ActiveRecord::Migration[5.2]
  def change
	  add_column :am_entries, :user_id, :integer
  end
end
