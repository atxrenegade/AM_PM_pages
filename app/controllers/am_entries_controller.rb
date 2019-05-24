require_relative 'application_controller.rb' #must stay because of alphabetical controller loading

class AMEntriesController < ApplicationController
	get '/index' do
		redirect_if_not_logged_in
		am_entries = current_user.AMEntries
		pm_entries = current_user.PMEntries
		@entries = (am_entries + pm_entries).sort_by(&:created_at)
		@username = current_user.username.strip
		erb :'/index'
	end

	get '/am_entries/new' do
		redirect_if_not_logged_in
		erb :'am_entries/new'
	end

	post '/am_entries' do
		redirect_if_not_logged_in
		@am_entry = AMEntry.new(goals1: params["goals1"], goals2: params["goals2"], goals3: params["goals3"], affirmation: params["affirmation"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
		@am_entry.awesome = params["awesome"].strip
		@am_entry.words = params["words"].strip
		@am_entry.user_id = session[:id]
		if @am_entry && @am_entry.user_id == current_user.id
			@am_entry.save
			redirect "/am_entries/#{@am_entry.id}"
		else
			redirect '/main_menu'
		end
	end

	get '/am_entries/:id' do
		redirect_if_not_logged_in
		@am_entry = AMEntry.find_by_id(params[:id])
		if @am_entry && @am_entry.user_id == current_user.id
			@entry_date = @am_entry.convert_time
			erb :'/am_entries/show'
		else
			redirect '/index'
		end
	end

	get '/am_entries/:id/edit' do
		redirect_if_not_logged_in
		@am_entry = AMEntry.find_by_id(params[:id])
		if @am_entry && @am_entry.user_id == current_user.id
			@entry_date = @am_entry.convert_time
			erb :'/am_entries/edit'
		else
			redirect '/main_menu'
		end
	end

	patch '/am_entries/:id' do
		redirect_if_not_logged_in
		@am_entry = AMEntry.find_by_id(params[:id])
		if @am_entry && @am_entry.user_id == current_user.id
			@am_entry.update(goals1: params["goals1"], goals2: params["goals2"], goals3: params["goals3"], awesome: params["awesome"].strip, affirmation: params["affirmation"],
		 	words: params["words"].strip, gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"],  gratitude4: params["gratitude4"], gratitude5: params["gratitude5"], user_id: current_user.id)
			redirect "/am_entries/#{@am_entry.id}"
		else
			redirect '/main_menu'
		end
	end

	delete '/am_entries/:id/delete' do
		redirect_if_not_logged_in
		@am_entry = AMEntry.find_by_id(params[:id])
		if @am_entry && @am_entry.user_id == current_user.id
			@am_entry.destroy
			redirect '/index'
		else
			redirect '/main_menu'
		end
	end
end
