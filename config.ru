require './config/env'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending. Run 'rake:dbmigrate' to resolve the issue."
end

use Rack::MethodOverride
use RecipientsController
use UsersController
run AppController
