require 'bundler'

Bundler.require

ActiveRecord::Base.establish connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'
