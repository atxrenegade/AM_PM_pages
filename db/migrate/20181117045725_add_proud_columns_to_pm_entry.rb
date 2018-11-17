class AddProudColumnsToPmEntry < ActiveRecord::Migration[5.2]
  def change
	  add_column :pm_entries, :proud_1, :string
	  add_column :pm_entries, :proud_2, :string
  end
end
