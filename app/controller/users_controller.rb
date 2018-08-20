class UsersController < ActiveRecord::Base

	get 'users/sign_up' do
		erb :view
	end

	get 'users/login_in' do
		erb :login_in
	end

	post 'users/sign_up' do
		#validate and store params
		erb index
	end

	get '/users/error' do
		erb :error
	end

	post 'users/sign_up' do
		#validate and store params
		erb :index
	end

end
