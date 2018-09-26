module TimeConversion
	module InstanceMethods
		def convert_time
			self.updated_at.localtime.strftime("%B %e %Y, %l:%m %p")
		end
	end
end
