class CreateAmEntries < ActiveRecord::Migration[5.2]
  	def change
	  	create_table :am_entrys do |t|
		  	t.date :date #check time/date
			t.timestamp :time
			t.string :goals
			t.string :awesome
			t.string :affirmation
			t.string :gratitude
			t.string :words
  		end
	end
end
