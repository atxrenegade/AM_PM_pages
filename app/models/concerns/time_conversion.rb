module TimeConversion
	module InstanceMethods
		def convert_time
			self.created_at.localtime.strftime("%B %e %Y, %l:%M %p")
		end
	end
end
