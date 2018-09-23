class PMEntriesController < ApplicationController
	get '/index' do
		am_entries = AMEntry.where(user_id: session[:id])
		pm_entries = PMEntry.where(user_id: session[:id])
		@entries = (am_entries + pm_entries).sort_by(&:created_at)
		#controller action duplicated in am_controller should I remove one?
		erb :'/index'
	end

	get '/pm_entries/new' do
		erb :'pm_entries/new'
	end

	post '/pm_entries/new' do
		@pm_entry = PMEntry.new(excellent1: params["excellent1"], excellent2: params["excellent2"], lessons1: params["lessons1"], lessons2: params["lessons2"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
		@pm_entry.thoughts = params["thoughts"].strip
		@pm_entry.user_id = session[:id]
		@pm_entry.save

		redirect "/pm_entries/show/#{@pm_entry.id}"
	end

	get '/pm_entries/show/:id' do
		@pm_entry = PMEntry.find_by_id(params[:id])
		#replace with helper method format_date
		@time_date = @pm_entry.created_at.localtime.to_formatted_s(:long_ordinal)
		erb :'/pm_entries/show'
	end

	get '/pm_entries/:id/edit' do
		@pm_entry = PMEntry.find_by_id(params[:id])
		erb :'/pm_entries/edit'
	end

	patch '/pm_entries/:id' do

		@pm_entry = PMEntry.find_by_id(params[:id])
		@pm_entry = PMEntry.update(excellent1: params["excellent1"], excellent2: params["excellent2"], lessons1: params["lessons1"], lessons2: params["lessons2"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
		@pm_entry.thoughts = params["thoughts"].strip
		@pm_entry.user_id = session[:id]
		@pm_entry.save
		redirect "/pm_entries/show/#{@pm_entry.id}"
	end

	delete '/pm_entries/:id/delete' do
		@pm_entry = PMEntry.find_by_id(params[:id])
		@pm_entry.destroy
		redirect '/index'
	end
end
