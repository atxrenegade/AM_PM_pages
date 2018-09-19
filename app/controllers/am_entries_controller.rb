require_relative 'application_controller.rb'
class AMEntriesController < ApplicationController
	get '/am_entries/new' do
		erb :'am_entries/new'
	end

	post '/am_entries/new' do
		#binding.pry
		erb :'/am_entries/show'
	end
end
