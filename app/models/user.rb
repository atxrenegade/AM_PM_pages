class User < ActiveRecord::Base
	has_secure_password

	has_many :AMEntries
	has_many :PMEntries
end
