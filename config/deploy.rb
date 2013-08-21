require 'bundler/capistrano'
require 'intercity/capistrano'

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :application, "statsboard_production"
set :repository,  "git@github.com:michiels/statsboard.git"

server "intercityup.com", :web, :app, :db, primary: true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"