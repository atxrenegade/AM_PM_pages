class CreatePmEntries < ActiveRecord::Migration[5.2]
  	def change
	  	create_table :pm_entrys do |t|
			t.date :date
			t.timestamp :time
			t.string :excellent
			t.string :lessons
			t.string :gratitude
			t.string :thoughts
	  	end
  	end
end
