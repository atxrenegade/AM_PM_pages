require './config/environment'

require_relative 'app/controllers/application_controller.rb'
require_relative 'app/controllers/users_controller.rb'
require_relative 'app/controllers/am_entries_controller.rb'
require_relative 'app/controllers/pm_entries_controller.rb'

use Rack::MethodOverride

use UsersController
use AMEntriesController
use PMEntriesController

run ApplicationController
