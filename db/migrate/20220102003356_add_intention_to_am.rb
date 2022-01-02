class AddIntentionToAm < ActiveRecord::Migration[6.1]
  def change
    add_column :am_entries, :intention, :string
  end
end
