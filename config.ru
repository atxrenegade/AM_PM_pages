require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
	raise "Migrations are pending. Run 'rake db:migrate' to resolve this issue."
end

run ApplicationController

#NOTE: this test may not run correctly with older versions of ruby, if an issue arises change line 3 to "if ActiveRecord::Migrator.needs_migration?"
