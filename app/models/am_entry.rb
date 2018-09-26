class AMEntry < ActiveRecord::Base
	require_relative './concerns/time_conversion.rb'
	include TimeConversion::InstanceMethods
	
	belongs_to :user
end
