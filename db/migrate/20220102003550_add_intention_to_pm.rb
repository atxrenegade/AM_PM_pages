class AddIntentionToPm < ActiveRecord::Migration[6.1]
  def change
    add_column :pm_entries, :intention_pm, :string
  end
end
