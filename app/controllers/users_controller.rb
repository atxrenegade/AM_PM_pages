class UsersController < Sinatra::Base

	get 'users/sign_up' do
		erb :'users/view'
	end

	get 'users/login_in' do
		erb :'users/login_in'
	end

	post 'users/sign_up' do
		#validate and store params
		erb :'./index'
	end

	get '/users/error' do
		erb :'users/error'
	end

	post 'users/sign_up' do
		#validate and store params
		erb :'./index'
	end
end
