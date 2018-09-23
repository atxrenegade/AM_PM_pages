class PMEntriesController < ApplicationController
	get '/index' do
		if logged_in?
			am_entries = AMEntry.where(user_id: session[:id])
			pm_entries = PMEntry.where(user_id: session[:id])
			@entries = (am_entries + pm_entries).sort_by(&:created_at)
			#controller action duplicated in am_controller should I remove one?
			erb :'/index'
		else
			redirect '/login'
		end
	end

	get '/pm_entries/new' do
		if logged_in?
			erb :'pm_entries/new'
		else
			redirect '/login'
		end
	end

	get '/pm_entries/show/:id' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
			if @pm_entry && @pm_entry.user_id == current_user.id
				#replace with helper method format_date
				@time_date = @pm_entry.created_at.localtime.to_formatted_s(:long_ordinal)
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
				erb :'/pm_entries/edit'
			else
				redirect '/main_menu'
			end
		else
			redirect '/login'
		end
	end

	post '/pm_entries/new' do
		if logged_in?
			@pm_entry = PMEntry.new(excellent1: params["excellent1"], excellent2: params["excellent2"], lessons1: params["lessons1"], lessons2: params["lessons2"], gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"])
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

	patch '/pm_entries/:id' do
		if logged_in?
			@pm_entry = PMEntry.find_by_id(params[:id])
				if @pm_entry && @pm_entry.user_id == current_user.id
				@pm_entry = PMEntry.update(params["excellent1"], params["excellent2"],  params["lessons1"], params["lessons2"], params["thoughts"].strip, params["gratitude1"], params["gratitude2"], params["gratitude3"], params["gratitude4"],  params["gratitude5"])
				@pm_entry.save
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
