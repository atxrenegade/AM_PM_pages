class Helpers < ActiveRecord::Base

	def convert_time(entry)
		time = entry.created_at.localtime
		time.to_formatted_s(:long_ordinal)
		#formatting target("%A %B %e %Y, %l:%m:%M %p")
	end
end
