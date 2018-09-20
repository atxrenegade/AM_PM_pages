class User < ActiveRecord::Base
	has_secure_password

	has_many :AM_Entries
	has_many :PM_Entries
end
