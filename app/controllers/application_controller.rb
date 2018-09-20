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

	helpers do
		#this is duplicated in concerns
		def logged_in?
			!!session[:id]
		end

		def current_user
			User.find(session[:id])
		end
	end
end
