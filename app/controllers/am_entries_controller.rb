require_relative 'application_controller.rb'
class AMEntriesController < ApplicationController
	get '/am_entries' do
		binding.pry
		#am_entries = AM_Entry.all.find_all(AM_Entry.user_id == session[:id])
		#pm_entries =
		#@entries = am+pm entries order by date and time(or id number?)
		erb :'/index'
	end

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
		@am_entry = AM_Entry.new(time_date: @time_date, goals: goals_array, awesome: params["awesome"], affirmation: params["affirmation"], gratitude: gratitude_array, words: params["words"])
		@am_entry.user_id = session[:id]
		@am_entry.save
		redirect "/am_entries/show/#{@am_entry.id}"
	end

	get '/am_entries/:id/edit' do
		@am_entry = AM_Entry.find_by_id(params[:id])
		erb :'/am_entries/edit'
	end

	patch '/am_entries/:id/edit' do
		@am_entry = AM_Entry.find_by_id(params[:id])
		#update attributes here
		#
		#
		#
		#
		#
		@am_entry.save
		redirect '/am_entries/show/#{id}'
	end

	get '/am_entries/:id/delete' do
		@am_entry = AM_Entry.find_by_id(params[:id])
		@am_entry.destroy
		redirect '/index'
	end
end
