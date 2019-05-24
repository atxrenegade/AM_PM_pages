class UsersController < ApplicationController
	use Rack::Flash

	get '/sign_up' do
		if !logged_in?
			erb :'/users/sign_up'
		else
			redirect '/main_menu'
		end
	end

	post '/sign_up' do
		if !logged_in?
			if params[:username].empty? || params[:email].empty? || params[:password].empty?
				flash[:message] = "Sign up error. Please complete all the fields below."
				erb :'/users/sign_up'
			else
				@user = User.find_by(username: params["username"])
				if @user
						redirect '/sign_up'
				else
					@user = User.new(username: params["username"].strip, email: params["email"].strip, password: params["password"].strip)
					@user.save
					session[:id] = @user.id
					redirect '/main_menu'
				end
			end
		else
			redirect '/main_menu'
		end
	end

	get '/login' do
		if !logged_in?
			erb :'users/login'
		else
			redirect '/main_menu'
		end
	end

	post '/login' do
		if !logged_in?
			user = User.find_by(username: params["username"])
			if user && user.authenticate(params["password"])
				session[:id] = user[:id]
				redirect '/main_menu'
			else
				flash[:message] = "Login Error. Please input a valid username and password."
				redirect '/login'
			end
		else
			redirect '/main_menu'
		end
	end

	get '/logout' do
		if logged_in?
			session.clear
			redirect '/'
		else
			redirect '/login'
		end
	end

	get '/main_menu' do
		redirect_if_not_logged_in
		if logged_in?
			erb :main_menu
		else
			redirect '/login'
		end
	end
end
