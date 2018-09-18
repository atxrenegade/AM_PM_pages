class PMEntriesController < ApplicationController
	get '/pm_entries/new' do
		erb :'pm_entries/new'
	end

	post '/pm_entries/new' do
		binding.pry
	end
end
