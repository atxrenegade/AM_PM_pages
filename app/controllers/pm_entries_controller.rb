class PMEntriesController < ApplicationController
	get '/pm_entries/new' do
		erb :'pm_entries/new'
	end

	post '/pm_entries/new' do
		#binding.pry
		@time_date = "Month, Day Year  HH:MM:SS"
		excellent_array = params["excellent"].values
		lessons_array = params["lessons"].values
		gratitude_array = params["gratitude"].values
		@pm_entry = PM_Entry.new(time_date: @time_date, excellent: excellent_array, lessons: lessons_array, gratitude: gratitude_array, thoughts: params["thoughts"])
		@pm_entry.save

		redirect '/pm_entries/#{@pm_entry.id}/show'
	end
end
