class CreatePmEntries < ActiveRecord::Migration[5.2]
  	def change
	  	create_table :pm_entrys do |t|
			t.timestamp :time_date
			t.string :excellent
			t.string :lessons
			t.string :gratitude
			t.string :thoughts
	  	end
  	end
end
