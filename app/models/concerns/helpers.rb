class Helpers < ActiveRecord::Base

   	def logged_in?
	   !!session[:id]
   	end

   	def current_user
	   User.find(session[:id])
   	end

	def convert_time(entry)
		if entry.is_a? AMEntry
			time = AMEntry.created_at.localtime
			time.to_formatted_s(:long_ordinal)
		else
			time = PMEntry.created_at.localtime
			time.to_formatted_s(:long_ordinal)
		end
		#formatting target("%A %B %e %Y, %l:%m:%M %p")
	end
end
