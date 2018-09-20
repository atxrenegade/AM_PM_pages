class PMEntriesController < ApplicationController
	get '/index' do
		am_entries = AM_Entry.where(user_id: session[:id])
		pm_entries = PM_Entry.where(user_id: session[:id])
		@entries = (am_entries + pm_entries).sort_by(&:id)
		#change to order by timestamps or there will be duplicate ids between am/pm
		#controller action duplicated in am_controller should I remove one?

		erb :'/index'
	end

	get '/pm_entries/new' do
		erb :'pm_entries/new'
	end

	post '/pm_entries/new' do
		@time_date = "Month, Day Year  HH:MM:SS"
		excellent_array = params["excellent"].values
		lessons_array = params["lessons"].values
		gratitude_array = params["gratitude"].values
		@pm_entry = PM_Entry.new(time_date: @time_date, excellent: excellent_array, lessons: lessons_array, gratitude: gratitude_array, thoughts: params["thoughts"])
		@pm_entry.user_id = session[:id]
		@pm_entry.save

		redirect '/pm_entries/#{@pm_entry.id}/show'
	end

	get '/pm_entries/:id/edit' do
		@pm_entry = PM_Entry.find_by_id(params[:id])
		erb :'/pm_entries/edit'
	end

	patch '/pm_entries/:id/edit' do
		@pm_entry = PM_Entry.find_by_id(params[:id])
		#update attributes here
		#
		#
		#
		#
		#
		@am_entry.save
		redirect '/pm_entries/show/#{id}'
	end

	get '/pm_entries/:id/delete' do
		@pm_entry = AM_Entry.find_by_id(params[:id])
		@pm_entry.destroy
		redirect '/index'
	end
end
