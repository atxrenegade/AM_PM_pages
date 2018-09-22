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
end
