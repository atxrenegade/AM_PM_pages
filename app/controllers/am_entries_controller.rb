require_relative 'application_controller.rb' #must stay because of alphabetical controller loading
class AMEntriesController < ApplicationController
	get '/index' do
		am_entries = AMEntry.where(user_id: session[:id])
		pm_entries = PMEntry.where(user_id: session[:id])
		@entries = (am_entries + pm_entries).sort_by(&:created_at)
		#binding.pry
		@user = User.find(session[:id]).username.strip #replace with current_user method when working

		erb :'/index'
	end

	get '/am_entries/new' do
		erb :'am_entries/new'
	end

	get '/am_entries/show/:id' do
		@am_entry = AMEntry.find_by_id(params[:id])
		#replace with helper method format date
		@time_date = @am_entry.created_at.localtime.to_formatted_s(:long_ordinal)
		erb :'/am_entries/show'
	end

	post '/am_entries/new' do
		@am_entry = AMEntry.new(goals1: params["goals1"], goals2: params["goals2"], goals3: params["goals3"], affirmation: params["affirmation"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
		@am_entry.awesome = params["awesome"].strip
		@am_entry.words = params["words"].strip
		@am_entry.user_id = session[:id]
		@am_entry.save
		redirect "/am_entries/show/#{@am_entry.id}"
	end

	get '/am_entries/:id/edit' do
		@am_entry = AMEntry.find_by_id(params[:id])
		erb :'/am_entries/edit'
	end

	patch '/am_entries/:id/edit' do
		@am_entry = AMEntry.find_by_id(params[:id])
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
		@am_entry = AMEntry.find_by_id(params[:id])
		@am_entry.destroy
		redirect '/index'
	end
end
