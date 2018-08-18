class User < ActiveRecord::Base
	has_many :AM_Entrys
	has_many :PM_Entrys
	#does ActiveRecord recognize Entry or Entries as pluralization?
end
