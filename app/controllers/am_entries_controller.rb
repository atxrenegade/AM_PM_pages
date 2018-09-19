require_relative 'application_controller.rb'
class AMEntriesController < ApplicationController
	get '/am_entries/new' do
		erb :'am_entries/new'
	end

	post '/am_entries/new' do
		binding.pry
		@time_date = "Month, Day Year  HH:MM:SS"
		goals_array = params["goals"].values
		gratitude_array = params["gratitude"].values
		@am_entry = AM_Entry.new(time_date: @time_date, goals: goals_array, awesome: params["awesome"], affirmation: params["affirmation"], gratitude: gratitude_array, words: params["words"])
		@am_entry.save

		redirect '/am_entries/#{@am_entry.id}/show'
	end
end
