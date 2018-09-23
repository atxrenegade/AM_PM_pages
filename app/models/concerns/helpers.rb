class Helpers < ActiveRecord::Base

   	def logged_in?
	   !!session[:id]
   	end

   	def current_user
	   User.find(session[:id])
   	end

	def convert_time(entry)
		time = entry.created_at.localtime
		time.to_formatted_s(:long_ordinal)
		#formatting target("%A %B %e %Y, %l:%m:%M %p")
	end
end
