class AddIndividualAttributeColumnsAmPmEntry < ActiveRecord::Migration[5.2]
  def change
		add_column :am_entries, :goals1, :string
		add_column :am_entries, :goals2, :string
		add_column :am_entries, :goals3, :string
		add_column :am_entries, :gratitude1, :string
		add_column :am_entries, :gratitude2, :string
		add_column :am_entries, :gratitude3, :string
		add_column :am_entries, :gratitude4, :string
		add_column :am_entries, :gratitude5, :string

		add_column :pm_entries, :excellent1, :string
		add_column :pm_entries, :excellent2, :string
		add_column :pm_entries, :lessons1, :string
		add_column :pm_entries, :lessons2, :string
		add_column :pm_entries, :lessons3, :string
		add_column :pm_entries, :gratitude1, :string
		add_column :pm_entries, :gratitude2, :string
		add_column :pm_entries, :gratitude3, :string
		add_column :pm_entries, :gratitude4, :string
		add_column :pm_entries, :gratitude5, :string
  end
end
