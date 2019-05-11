require './config/env'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run 'rake:dbmigrate' to resolve the issue.
end

use Rack::MethodOverride
run AppController
