class AddUserIdColumnToPmEntry < ActiveRecord::Migration[5.2]
  def change
	   add_column :pm_entries, :user_id, :integer
  end
end
