require_relative 'application_controller.rb'
class AMEntriesController < ApplicationController

	get '/am_entries/new' do
		erb :'am_entries/new'
	end

	get '/am_entries/show/:id' do
		#binding.pry
		@am_entry = AM_Entry.find_by_id(params[:id])
		erb :'/am_entries/show'
	end

	post '/am_entries/new' do
		#binding.pry
		@time_date = "Month, Day Year  HH:MM:SS"
		goals_array = params["goals"].collect{|k, v| v.strip}
		#binding.pry
		gratitude_array = params["gratitude"].collect{|k, v| v.strip}
		#binding.pry
		@am_entry = AM_Entry.new(time_date: @time_date, goals: goals_array, awesome: params["awesome"], affirmation: params["affirmation"], gratitude: gratitude_array, words: params["words"])
		@am_entry.save

		redirect "/am_entries/show/#{@am_entry.id}"
	end

	get '/am_entries/:id/edit' do
		@am_entry = AM_Entry.find_by_id(params[:id])
		erb :'/am_entries/edit'
	end

	patch '/am'
		@am_entry = AM_Entry.find_by_id(params[:id])
		#update attributes here
		@am_entry.save
		reroute

	get '/am_entries/:id/delete' do
		#binding.pry
		@am_entry = AM_Entry.find_by_id(params[:id])
		@am_entry.destroy
		redirect '/index'
	end
end
