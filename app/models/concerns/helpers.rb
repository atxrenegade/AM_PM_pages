class Helpers < ActiveRecord::Base

   	def logged_in?
	   !!session[:id]
   	end

   	def current_user
	   User.find(session[:id])
   	end

	def convert_time

	end
end
