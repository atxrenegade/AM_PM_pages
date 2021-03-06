require 'rack-flash'

class ApplicationController < Sinatra::Base
	configure do
		enable :sessions
		set :session_secret, 'secret'
		set :public_folder, 'public'
		set :views, 'app/views'
	end

	get '/' do
		erb :welcome
	end

	get '/about' do
  		erb :about
	end


	helpers do
	   	def logged_in?
		   !!session[:id]
	   	end

	   	def current_user
		   @current_user ||= User.find(session[:id])
	   	end

			def redirect_if_not_logged_in
				if !logged_in?
					redirect '/login'
				end
			end
   	end
end
