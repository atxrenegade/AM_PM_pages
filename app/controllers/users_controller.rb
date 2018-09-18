class UsersController < ApplicationController

	get '/sign_up' do
		erb :'/users/sign_up'
	end

	post '/sign_up' do
		if !params[:username].empty? || !params[:email].empty? || !params[:password].empty?
			@user = User.new(username: params[:username], email: params[:email], password: params[:password])
			@user.save
			erb :'./index'
		else
			redirect '/signup'
			#add flash message - Sign up error. Please complete all the fields below
		end
	end

	get '/login_in' do
		erb :'users/login_in'
	end

	get '/error' do
		erb :'/users/error'
	end
end
