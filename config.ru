require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
	raise "Migrations are pending. Run 'rake db:migrate' to resolve this issue."
end

#NOTE: this test may not run correctly with older versions of ruby, if an issue arises change line 3 to "if ActiveRecord::Migrator.needs_migration?"

require_relative 'app/controllers/application_controller.rb'
require_relative 'app/controllers/users_controller.rb'
require_relative 'app/controllers/am_entries_controller.rb'
require_relative 'app/controllers/pm_entries_controller.rb'

use Rack::MethodOverride

use UsersController
use AMEntriesController
use PMEntriesController

run ApplicationController
