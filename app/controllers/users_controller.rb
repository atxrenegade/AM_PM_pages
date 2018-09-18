class UsersController < ApplicationController

	get '/sign_up' do
		erb :'/users/sign_up'
	end

	post '/sign_up' do
		if !params[:username].empty? || !params[:email].empty? || !params[:password].empty?
			@user = User.new(username: params["username"], email: params["email"], password: params["password"])
			@user.save
			erb :'./index'
		else
			redirect '/signup'
			#add flash message - Sign up error. Please complete all the fields below
		end
	end

	get '/login' do
		erb :'users/login'
	end

	post '/login' do
		#binding.pry
		user = User.find_by(username: params["username"])
		if user && user.authenticate(params["password"])
			session[:id] = user[:id]
			erb :'/main_menu'
		else
			redirect '/login'
			#flash message - Login Error. Please input a valid username and password
		end
	end

	get '/error' do
		erb :'/users/error'
	end
end
