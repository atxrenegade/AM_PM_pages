class PMEntriesController < ApplicationController

	get '/pm_entries/new' do
		if logged_in?
			erb :'pm_entries/new'
		else
			redirect '/login'
		end
	end

	post '/pm_entries/new' do
		if logged_in?
			@pm_entry = PMEntry.new(excellent1: params["excellent1"], excellent2: params["excellent2"], lessons1: params["lessons1"], lessons2: params["lessons2"], proud1: params["proud1"], proud2: params["proud2"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
			@pm_entry.thoughts = params["thoughts"].strip
			@pm_entry.user_id = session[:id]
			if @pm_entry && @pm_entry.user_id == current_user.id
				@pm_entry.save
				redirect "/pm_entries/show/#{@pm_entry.id}"
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	get '/pm_entries/show/:id' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
			if @pm_entry && @pm_entry.user_id == current_user.id
				@entry_date = @pm_entry.convert_time
				erb :'/pm_entries/show'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	get '/pm_entries/:id/edit' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
			if @pm_entry && @pm_entry.user_id == current_user.id
				@entry_date = @pm_entry.convert_time
				erb :'/pm_entries/edit'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	patch '/pm_entries/:id' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
			if @pm_entry && @pm_entry.user_id == current_user.id
				@pm_entry.update(excellent1: params["excellent1"], excellent2: params["excellent2"], lessons1: params["lessons1"], lessons2: params["lessons2"], proud1: params["proud1"], proud2: params["proud2"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"], thoughts: params["thoughts"].strip! )
				redirect "/pm_entries/show/#{@pm_entry.id}"
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	delete '/pm_entries/:id/delete' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
			if @pm_entry && @pm_entry.user_id == current_user.id
				@pm_entry.destroy
				redirect '/index'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end
end
