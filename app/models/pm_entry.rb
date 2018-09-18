class PM_Entry < ActiveRecord::Base
	belongs_to :user

	get '/pm_entries/new' do
		erb :'pm_entries/new'
	end

	post '/pm_entries/new' do
		binding.pry
	end
end
