require_relative 'application_controller.rb' #must stay because of alphabetical controller loading
class AMEntriesController < ApplicationController
	get '/index' do
		if logged_in?
			am_entries = AMEntry.where(user_id: session[:id])
			pm_entries = PMEntry.where(user_id: session[:id])
			@entries = (am_entries + pm_entries).sort_by(&:created_at)
			#binding.pry
			@user = User.find(session[:id]).username.strip #replace with current_user method when working
			erb :'/index'
		else
			redirect '/login'
		end
	end

	get '/am_entries/new' do
		if logged_in?
			erb :'am_entries/new'
		else
			redirect '/login'
		end
	end

	get '/am_entries/show/:id' do
		if logged_in?
			@am_entry = AMEntry.find_by_id(params[:id])
			if @am_entry && @am_entry.user_id == current_user.id
				#replace with helper method format date
				@time_date = @am_entry.created_at.localtime.to_formatted_s(:long_ordinal)
				erb :'/am_entries/show'
			else
				redirect '/index'
			end
		else
			redirect '/login'
		end
	end

	post '/am_entries/new' do
		if logged_in?
			@am_entry = AMEntry.new(goals1: params["goals1"], goals2: params["goals2"], goals3: params["goals3"], affirmation: params["affirmation"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
			@am_entry.awesome = params["awesome"].strip
			@am_entry.words = params["words"].strip
			@am_entry.user_id = session[:id]
			if @am_entry && @am_entry.user_id == current_user.id
				@am_entry.save
				redirect "/am_entries/show/#{@am_entry.id}"
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	get '/am_entries/:id/edit' do
		if logged_in?
			@am_entry = AMEntry.find_by_id(params[:id])
			if @am_entry && @am_entry.user_id == current_user.id
				erb :'/am_entries/edit'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	patch '/am_entries/:id' do
		#controller action not working correctly
		if logged_in?
			@am_entry = AMEntry.find_by_id(params[:id])
			if @am_entry && @am_entry.user_id == current_user.id
				@am_entry = AMEntry.update(params["goals1"], params["goals2"], params["goals3"], params["awesome"].strip, params["affirmation"],
			 	params["words"].strip, params["gratitude1"], params["gratitude2"], params["gratitude3"],  params["gratitude4"], params["gratitude5"])
				@am_entry.save
				redirect "/am_entries/show/#{@am_entry.id}"
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	delete '/am_entries/:id/delete' do
		#this controller action is NOT working correctly
		if logged_in?
			@am_entry = AMEntry.find_by_id(params[:id])
			if @am_entry && @am_entry.user_id == current_user.id
				@am_entry.destroy
				redirect '/index'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end
end
