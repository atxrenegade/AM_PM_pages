require_relative 'application_controller.rb' #must stay because of alphabetical controller loding
class AMEntriesController < ApplicationController
	get '/index' do
		#binding.pry
		am_entries = AM_Entry.where(user_id: session[:id])
		pm_entries = PM_Entry.where(user_id: session[:id])
		@entries = (am_entries + pm_entries).sort_by(&:id)
		#change to order by timestamps or there will be duplicate ids between am/pm how will duplicates be ordered


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
