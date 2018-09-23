class UsersController < ApplicationController
	use Rack::Flash

	get '/sign_up' do
		erb :'/users/sign_up'
	end

	post '/sign_up' do
		if params[:username].empty? || params[:email].empty? || params[:password].empty?
			flash[:message] = "Sign up error. Please complete all the fields below."
			redirect '/sign_up'
		else
			@user = User.new(username: params["username"], email: params["email"], password: params["password"])
			@user.save
			erb :'/main_menu'
		end
	end

	get '/login' do
		erb :'users/login'
	end

	post '/login' do
		user = User.find_by(username: params["username"])
		if user && user.authenticate(params["password"])
			session[:id] = user[:id]
			erb :'/main_menu'
		else
			flash[:message] = "Login Error. Please input a valid username and password."
			redirect '/login'
		end
	end

	get '/logout' do
		session.clear
		redirect '/'
	end

	get '/main_menu' do
		erb :main_menu
	end
end
