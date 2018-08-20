class User < ActiveRecord::Base
	has_many :AM_Entries
	has_many :PM_Entries
	#does ActiveRecord recognize Entry or Entries as pluralization?
end
