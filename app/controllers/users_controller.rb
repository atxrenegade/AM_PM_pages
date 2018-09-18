class UsersController < ApplicationController

	get '/sign_up' do
		erb :'/users/sign_up'
	end

	get '/login_in' do
		erb :'users/login_in'
	end

	post '/sign_up' do
		#validate and store params
		erb :'./index'
	end

	get '/error' do
		erb :'/users/error'
	end

	post '/users/sign_up' do
		#validate and store params
		erb :'./index'
	end
end
